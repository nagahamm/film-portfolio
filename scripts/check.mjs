#!/usr/bin/env node
// ==========================================================
// 静的検証。依存パッケージなし(docs/design.md「検証」)。
//
//   node scripts/check.mjs          テーマ(コミットの前に毎回)
//   node scripts/check.mjs --site   テーマ + 書き出し結果 site/(公開の前。scripts/publish.sh が実行する)
//
// テンプレートの中身の多くは入力値から作られるため、参照先・アンカー・表記は
// 書き出し結果で確かめる。テーマの段階では、入力値に依らない規約だけを見る。
// ==========================================================
import { readFileSync, existsSync, readdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';

const errors = [];
const fail = (msg) => errors.push(msg);

const phpFiles = ['.', 'inc', 'template-parts']
  .flatMap((d) => readdirSync(d).filter((f) => f.endsWith('.php')).map((f) => (d === '.' ? f : `${d}/${f}`)));
// テンプレートは PHP を取り除いて HTML として検査する
const templates = phpFiles.map((f) => [f, readFileSync(f, 'utf8').replace(/<\?php[\s\S]*?\?>/g, '')]);
const css = readFileSync('css/style.css', 'utf8');
const netlify = readFileSync('netlify.toml', 'utf8');
const r2Video = netlify.match(/from\s*=\s*"\/assets\/videos\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];
const r2Upload = netlify.match(/from\s*=\s*"\/wp-content\/uploads\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];
const INLINE_ATTRS = ['autoplay', 'muted', 'loop', 'playsinline', 'preload="metadata"'];
// アセット命名(CLAUDE.md)。小文字のみ。未確定の番号は x で仮置き(連番は xx)
const ASSET_NAME = /^\d{4}-\d{2}-\d{2}__(?:cam|bts|loc|scr|doc)_(?:\d{2}|xx)__[a-z0-9-]+\.[a-z0-9]+$/;

// --- 1. JS の構文 -----------------------------------------
for (const f of ['js/main.js', ...readdirSync('scripts').filter((f) => f.endsWith('.mjs')).map((f) => `scripts/${f}`)]) {
  try {
    execFileSync(process.execPath, ['--check', f], { stdio: 'pipe' });
  } catch (e) {
    fail(`${f}: 構文エラー\n${e.stderr}`);
  }
}

// --- 2. PHP の構文 ----------------------------------------
for (const f of phpFiles) {
  try {
    execFileSync('php', ['-l', f], { stdio: 'pipe' });
  } catch (e) {
    fail(e.code === 'ENOENT' ? 'php が見つからない(brew install php)' : `${f}: 構文エラー\n${e.stdout}`);
    if (e.code === 'ENOENT') break;
  }
}

// --- 3. 動画タグの規約 ------------------------------------
// インライン動画は自動再生・ループ・poster 必須。モーダルの
// プレイヤーは controls で開くため対象外。
for (const [file, src] of templates) {
  for (const [tag] of src.matchAll(/<video\b[^>]*>/g)) {
    if (tag.includes('id="modal-video-player"')) continue;
    for (const attr of [...INLINE_ATTRS, 'poster=']) {
      if (!tag.includes(attr)) fail(`${file}: インライン動画に ${attr} が無い`);
    }
  }
}

// --- 4. インラインスタイルの禁止 --------------------------
for (const [file, src] of templates) {
  if (/\sstyle="/.test(src)) fail(`${file}: インラインスタイルは禁止(装飾は css/style.css へ)`);
}

// --- 5. CSS 変数の定義漏れ --------------------------------
const defined = new Set([...css.matchAll(/^\s*(--[\w-]+)\s*:/gm)].map((m) => m[1]));
for (const [, name] of css.matchAll(/var\((--[\w-]+)/g)) {
  if (!defined.has(name)) fail(`css/style.css: 未定義の変数 — var(${name})`);
}

// --- 6. 入力欄の定義 --------------------------------------
for (const f of readdirSync('acf-json').filter((f) => f.endsWith('.json'))) {
  try {
    // 管理画面はラベル・説明を HTML として扱い、<…> はタグとして消える
    JSON.stringify(JSON.parse(readFileSync(`acf-json/${f}`, 'utf8')), (key, value) => {
      if ((key === 'label' || key === 'instructions') && /[<>]/.test(value)) {
        fail(`acf-json/${f}: ラベル・説明に < > がある(管理画面で消える) — ${value}`);
      }
      return value;
    });
  } catch (e) {
    fail(`acf-json/${f}: JSON として読めない — ${e.message}`);
  }
}

// --- 7. アセットの命名 ----------------------------------
for (const dir of readdirSync('uploads', { withFileTypes: true }).filter((e) => e.isDirectory())) {
  for (const f of readdirSync(`uploads/${dir.name}`).filter((f) => !f.startsWith('.'))) {
    if (!ASSET_NAME.test(f)) fail(`uploads/${dir.name}/${f}: アセット命名に沿っていない`);
  }
}

// --- 8. 書き出し結果(--site) ------------------------------
// 公開する site/ そのものを見る。テンプレートからは見えない入力値由来の
// 参照・アンカー・表記を、ここで確かめる(docs/design.md「検証」)。
if (process.argv.includes('--site')) {
  const walk = (d) => readdirSync(d, { withFileTypes: true })
    .flatMap((e) => (e.isDirectory() ? walk(`${d}/${e.name}`) : [`${d}/${e.name}`]));
  if (!existsSync('site')) fail('site/ が無い(node scripts/export-site.mjs で書き出す)');
  const pagesOut = existsSync('site') ? walk('site').filter((f) => f.endsWith('.html')) : [];
  const siteMedia = new Map(); // path → file, R2 で確かめる参照

  for (const file of pagesOut) {
    const src = readFileSync(file, 'utf8');

    // 参照先の実在。画像・PDF・動画は R2 へ問い合わせる
    for (const [, url] of src.matchAll(/(?:href|src|poster|data-src)="(\/(?!\/)[^"#?]*)/g)) {
      if (url.startsWith('/assets/videos/') || url.startsWith('/wp-content/uploads/')) siteMedia.set(url, file);
      else if (!existsSync(`site${url}${url.endsWith('/') ? 'index.html' : ''}`)) fail(`${file}: 参照先が書き出されていない — ${url}`);
    }

    // ページ内アンカーの行き先
    const ids = new Set([...src.matchAll(/\bid="([^"]+)"/g)].map((m) => m[1]));
    for (const [, hash] of src.matchAll(/href="#([^"]+)"/g)) {
      if (!ids.has(hash)) fail(`${file}: 行き先の無いアンカー — #${hash}`);
    }

    // 本編の埋め込み(本編の URL から作る。読み取れないと空になる)
    for (const [, embed] of src.matchAll(/id="film-embed"[^>]*data-src="([^"]*)"/g)) {
      if (!/^https:\/\/www\.instagram\.com\/reel\/[\w-]+\/embed\/$/.test(embed)) fail(`${file}: 本編の埋め込み URL を作れない(本編の URL を確認) — 「${embed}」`);
    }

    // 作品概要のカードは2行以上なら箇条書き(改行のまま文で出ていない)
    for (const [, dd] of src.matchAll(/<dl class="slate-item">[\s\S]*?<dd>([\s\S]*?)<\/dd>/g)) {
      if (dd.includes('<br')) fail(`${file}: 作品概要のカードが箇条書きになっていない — ${dd.trim().slice(0, 60)}`);
    }

    // カルーセルは2枚以上(1枚では送る先の無い矢印と点が出る)
    for (const [, track] of src.matchAll(/<div class="carousel-track" data-carousel>([\s\S]*?)<\/div>\s*<button/g)) {
      if ((track.match(/class="carousel-slide"/g) ?? []).length < 2) fail(`${file}: スライドが1枚以下のカルーセル`);
    }

    // 写真の説明(読み上げ用)。飾りのポスターと、開くまで空の拡大表示だけは空でよい
    for (const [tag] of src.matchAll(/<img\b[^>]*>/g)) {
      if (/class="film-card-poster"|id="img-modal-image"/.test(tag)) continue;
      if (!/\balt="[^"]+"/.test(tag)) fail(`${file}: 写真の説明が無い — ${tag.slice(0, 120)}`);
    }

    // インライン動画の必須属性
    for (const [tag] of src.matchAll(/<video\b[^>]*>/g)) {
      if (tag.includes('id="modal-video-player"')) continue;
      for (const attr of [...INLINE_ATTRS, 'poster=']) {
        if (!tag.includes(attr)) fail(`${file}: インライン動画に ${attr} が無い — ${tag.slice(0, 80)}`);
      }
    }

    // WordPress 由来の出力・インラインスタイル・手元の URL の混入
    for (const [re, what] of [
      [/wp-json|wp-includes|wp-emoji|admin-ajax|xmlrpc|name="generator"/, 'WordPress 由来の出力'],
      [/\sstyle="/, 'インラインスタイル'],
      [/\.local\b/, '手元(Local)の URL'],
    ]) {
      if (re.test(src)) fail(`${file}: ${what}が混入している`);
    }

    // 表記ルール(CLAUDE.md「Content Conventions」)。表示される文字だけを見る
    const text = src
      .replace(/<(script|style|svg)\b[\s\S]*?<\/\1>/g, '')
      .replace(/<[^>]+>/g, '\n');
    for (const [re, rule] of [
      [/―/, '区切りのダッシュは — (U+2014)'],
      [/\.\.\./, '三点リーダーは …'],
      [/"|&quot;|“|”/, '強調は「」'],
      [/\bcolor\b/, '英語の綴りは colour'],
    ]) {
      const m = text.match(re);
      if (m) fail(`${file}: ${rule} — 「${text.slice(Math.max(0, m.index - 15), m.index + 15).replace(/\s+/g, ' ')}」`);
    }
    for (const [, caption] of src.matchAll(/<p class="(?:ep|compare)-caption">([\s\S]*?)<\/p>/g)) {
      if (/。\s*$/.test(caption)) fail(`${file}: キャプションの文末に「。」 — 「${caption.slice(-20)}」`);
    }
  }

  await Promise.all([...siteMedia].map(async ([path, file]) => {
    if (!ASSET_NAME.test(path.split('/').pop())) fail(`${file}: メディアがアセット命名に沿っていない — ${path}`);
    const url = path.startsWith('/assets/videos/')
      ? r2Video + path.slice('/assets/videos/'.length)
      : r2Upload + path.slice('/wp-content/uploads/'.length);
    try {
      const res = await fetch(url, { method: 'HEAD' });
      if (!res.ok) fail(`${file}: R2 にメディアが無い(${res.status}) — ${url}`);
    } catch (e) {
      fail(`${file}: R2 に接続できない — ${url}(${e.cause?.code ?? e.message})`);
    }
  }));
}

// --- 結果 -------------------------------------------------
if (errors.length) {
  console.error(errors.map((e) => `✗ ${e}`).join('\n'));
  console.error(`\n${errors.length} 件の問題があります。`);
  process.exit(1);
}
console.log('✓ 静的検証をすべて通過しました。');
