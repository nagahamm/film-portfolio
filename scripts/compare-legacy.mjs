#!/usr/bin/env node
// ==========================================================
// 移行中(#6)だけ使う比較。WordPress が出力したページと移行前の
// index.html・404.html を、同じ形に正規化してから突き合わせる。
// テンプレートが既存のクラス・属性・入れ子を保っているかを確かめるため。
// 移行が終わり index.html・404.html を削除するときに、このファイルも削除する。
//
//   node scripts/compare-legacy.mjs [Local のサイトの URL]
// ==========================================================
import { readFileSync, writeFileSync, mkdtempSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const site = (process.argv[2] || 'http://film-portfolio.local').replace(/\/$/, '');
const pairs = [
  ['index.html', `${site}/works/el-dorado/`, 200],
  ['404.html', `${site}/compare-legacy-not-found/`, 404],
];

// 読み込みの仕組みが違う <script> <link> は比べない。
// テーマ内アセットの URL は相対パスに戻す。
const normalize = (html) => html
  .replace(/<script\b[\s\S]*?<\/script>\s*/g, '')
  .replace(/<link\b[^>]*>\s*/g, '')
  // 表示されない HTML コメント(制作メモ)は比べない
  .replace(/<!--[\s\S]*?-->\s*/g, '')
  .replace(/https?:\/\/[^"]*?\/wp-content\/themes\/[^/"]+\//g, '')
  .replace(/"\/assets\/videos\/[^/"]+\//g, '"assets/videos/')
  // 画像・PDF は assets/(images|documents)/ からメディアライブラリ uploads/<作品>/ へ移る
  .replace(/https?:\/\/[^"]*?\/wp-content\/uploads\/[^/"]+\//g, 'media/')
  .replace(/"assets\/(?:images|documents)\//g, '"media/')
  // 改行・字下げの違いは比べない。タグの区切りで改行し直して差分を読みやすくする
  .replace(/\s*\n\s*/g, '')
  .replace(/>/g, '>\n') + '\n';

const dir = mkdtempSync(join(tmpdir(), 'compare-legacy-'));
let failed = false;

for (const [file, url, status] of pairs) {
  const res = await fetch(url);
  if (res.status !== status) {
    console.error(`✗ ${url} が ${res.status} を返しました(期待値 ${status})。`);
    failed = true;
    continue;
  }
  const legacy = join(dir, file);
  const current = join(dir, `wordpress-${file}`);
  writeFileSync(legacy, normalize(readFileSync(file, 'utf8')));
  writeFileSync(current, normalize(await res.text()));
  try {
    execFileSync('diff', ['-u', legacy, current], { stdio: 'inherit' });
    console.log(`✓ ${file} と同じ HTML が出力されています — ${url}`);
  } catch {
    console.error(`✗ ${file} との差分があります(- が移行前、+ が WordPress)。\n`);
    failed = true;
  }
}

if (failed) process.exit(1);
