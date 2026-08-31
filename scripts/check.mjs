#!/usr/bin/env node
// ==========================================================
// 静的検証 — ビルド工程を持たないサイトのため、公開前に
// 「壊れている状態でコミットされていないか」を機械的に確かめる。
// 依存パッケージなし。`npm test` 相当として `node scripts/check.mjs` で実行する。
// ==========================================================
import { readFileSync, existsSync } from 'node:fs';
import { execFileSync } from 'node:child_process';

const errors = [];
const fail = (msg) => errors.push(msg);

const html = ['index.html', '404.html'].map((f) => [f, readFileSync(f, 'utf8')]);
const css = readFileSync('css/style.css', 'utf8');
const netlify = readFileSync('netlify.toml', 'utf8');

// --- 1. JS の構文 -----------------------------------------
try {
  execFileSync(process.execPath, ['--check', 'js/main.js'], { stdio: 'pipe' });
} catch (e) {
  fail(`js/main.js: 構文エラー\n${e.stderr}`);
}

// --- 2. 参照アセットの実在 --------------------------------
// 動画だけは実体が Cloudflare R2 にあるため、ディスクではなく
// netlify.toml のリダイレクト定義側で存在を確かめる。
const redirects = new Set([...netlify.matchAll(/from\s*=\s*"([^"]+)"/g)].map((m) => m[1]));

for (const [file, src] of html) {
  for (const [, path] of src.matchAll(/(?:src|href|poster)="((?:assets|css|js)\/[^"]+)"/g)) {
    if (path.startsWith('assets/videos/')) {
      if (!redirects.has(`/${path}`)) fail(`${file}: ${path} に対応する netlify.toml のリダイレクトが無い(本番で404になる)`);
    } else if (!existsSync(path)) {
      fail(`${file}: 参照先が存在しない — ${path}`);
    }
  }
}

// 使われなくなったリダイレクトの取り残し
const referenced = new Set(html.flatMap(([, s]) => [...s.matchAll(/"(assets\/videos\/[^"]+)"/g)].map((m) => `/${m[1]}`)));
for (const from of redirects) {
  if (from.startsWith('/assets/videos/') && !referenced.has(from)) fail(`netlify.toml: どこからも参照されていないリダイレクト — ${from}`);
}

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
for (const [file, src] of html) {
  const ids = new Set([...src.matchAll(/\bid="([^"]+)"/g)].map((m) => m[1]));
  for (const [, hash] of src.matchAll(/href="#([^"]+)"/g)) {
    if (!ids.has(hash)) fail(`${file}: 行き先の無いアンカー — #${hash}`);
  }
}

// --- 結果 -------------------------------------------------
if (errors.length) {
  console.error(errors.map((e) => `✗ ${e}`).join('\n'));
  console.error(`\n${errors.length} 件の問題があります。`);
  process.exit(1);
}
console.log('✓ 静的検証をすべて通過しました。');
