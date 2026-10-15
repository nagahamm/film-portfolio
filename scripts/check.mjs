#!/usr/bin/env node
// ==========================================================
// 静的検証 — ビルド工程を持たないサイトのため、公開前に
// 「壊れている状態でコミットされていないか」を機械的に確かめる。
// 依存パッケージなし。`npm test` 相当として `node scripts/check.mjs` で実行する。
// ==========================================================
import { readFileSync, existsSync, readdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';

const errors = [];
const fail = (msg) => errors.push(msg);

// テーマのテンプレートは PHP を取り除いて HTML として検査する。
// fp_asset('x') は出力どおり assets/x に置き換え、従来の検査をそのまま当てる。
// fp_video('x') は作品の slug を含む assets/videos/<slug>/x になる。移行中は作品が
// エル・ドラドだけなので el-dorado で置き換える(動画が入力欄に移れば不要になる)。
const template = (src) => src
  .replace(/<\?php fp_asset\( '([^']+)' \); \?>/g, 'assets/$1')
  .replace(/<\?php fp_video\( '([^']+)' \); \?>/g, 'assets/videos/el-dorado/$1')
  // 実行時に URL が前に付くアンカー(ナビの nav_base)は、ページ内アンカーとして扱わない
  .replace(/<\?php[\s\S]*?\?>#/g, 'php:#')
  .replace(/<\?php[\s\S]*?\?>/g, '');
const read = (f) => [f, f.endsWith('.php') ? template(readFileSync(f, 'utf8')) : readFileSync(f, 'utf8')];
const phpFiles = ['.', 'inc', 'template-parts']
  .flatMap((d) => readdirSync(d).filter((f) => f.endsWith('.php')).map((f) => (d === '.' ? f : `${d}/${f}`)));

// 1枚のページを構成するファイルの組。アンカーの行き先はページ単位で探す。
const pages = [
  ['index.html'],
  ['404.html'],
  ['header.php', 'single-work.php', ...readdirSync('template-parts').map((f) => `template-parts/${f}`), 'footer.php'],
  ['header.php', '404.php', 'footer.php'],
];
const html = [...new Set(pages.flat())].map(read);
const files = Object.fromEntries(html);
const css = readFileSync('css/style.css', 'utf8');
const netlify = readFileSync('netlify.toml', 'utf8');

// --- 1. JS の構文 -----------------------------------------
try {
  execFileSync(process.execPath, ['--check', 'js/main.js'], { stdio: 'pipe' });
} catch (e) {
  fail(`js/main.js: 構文エラー\n${e.stderr}`);
}

// --- 1b. PHP の構文 ---------------------------------------
for (const f of phpFiles) {
  try {
    execFileSync('php', ['-l', f], { stdio: 'pipe' });
  } catch (e) {
    fail(e.code === 'ENOENT' ? 'php が見つからない(brew install php)' : `${f}: 構文エラー\n${e.stdout}`);
    if (e.code === 'ENOENT') break;
  }
}

// --- 2. 参照アセットの実在 --------------------------------
// 動画だけは実体が Cloudflare R2 にあるため、netlify.toml の振り向け先へ
// HEAD リクエストを送って存在を確かめる(ネットワークが必要)。
// 移行前の index.html・404.html の動画は対象外(#6 で削除する)。
const r2 = netlify.match(/from\s*=\s*"\/assets\/videos\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];
const videos = new Map();

for (const [file, src] of html) {
  for (const [, path] of src.matchAll(/(?:src|href|poster)="((?:assets|css|js)\/[^"]+)"/g)) {
    if (path.startsWith('assets/videos/')) {
      if (file.endsWith('.php')) videos.set(path, file);
    } else if (!existsSync(path)) {
      fail(`${file}: 参照先が存在しない — ${path}`);
    }
  }
}

await Promise.all([...videos].map(async ([path, file]) => {
  const url = r2 + path.slice('assets/videos/'.length);
  try {
    const res = await fetch(url, { method: 'HEAD' });
    if (!res.ok) fail(`${file}: R2 に動画が無い(${res.status}、本番で再生できない) — ${url}`);
  } catch (e) {
    fail(`${file}: R2 に接続できない — ${url}(${e.cause?.code ?? e.message})`);
  }
}));

// --- 3. 動画タグの規約 ------------------------------------
// インライン動画は自動再生・ループ・poster 必須。モーダルの
// プレイヤーは controls で開くため対象外。
const INLINE_ATTRS = ['autoplay', 'muted', 'loop', 'playsinline', 'preload="metadata"'];
for (const [file, src] of html) {
  for (const [tag] of src.matchAll(/<video\b[^>]*>/g)) {
    if (tag.includes('id="modal-video-player"')) continue;
    const name = (tag.match(/src="([^"]+)"/) || [, '(src なし)'])[1];
    for (const attr of INLINE_ATTRS) {
      if (!tag.includes(attr)) fail(`${file}: インライン動画に ${attr} が無い — ${name}`);
    }
    if (!tag.includes('poster=')) fail(`${file}: インライン動画に poster が無い — ${name}`);
  }
}

// --- 4. インラインスタイルの禁止 --------------------------
for (const [file, src] of html) {
  if (/\sstyle="/.test(src)) fail(`${file}: インラインスタイルは禁止(装飾は css/style.css へ)`);
}

// --- 5. CSS 変数の定義漏れ --------------------------------
const defined = new Set([...css.matchAll(/^\s*(--[\w-]+)\s*:/gm)].map((m) => m[1]));
for (const [, name] of css.matchAll(/var\((--[\w-]+)/g)) {
  if (!defined.has(name)) fail(`css/style.css: 未定義の変数 — var(${name})`);
}

// --- 6. ページ内アンカーの行き先 --------------------------
for (const page of pages) {
  const src = page.map((f) => files[f]).join('\n');
  const ids = new Set([...src.matchAll(/\bid="([^"]+)"/g)].map((m) => m[1]));
  for (const [, hash] of src.matchAll(/href="#([^"]+)"/g)) {
    if (!ids.has(hash)) fail(`${page.join(' + ')}: 行き先の無いアンカー — #${hash}`);
  }
}

// --- 結果 -------------------------------------------------
if (errors.length) {
  console.error(errors.map((e) => `✗ ${e}`).join('\n'));
  console.error(`\n${errors.length} 件の問題があります。`);
  process.exit(1);
}
console.log('✓ 静的検証をすべて通過しました。');
