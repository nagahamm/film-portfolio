#!/usr/bin/env node
// ==========================================================
// 移行中(#6)だけ使う比較。WordPress が出力した作品ページと
// 移行前の index.html を、同じ形に正規化してから突き合わせる。
// テンプレートが既存のクラス・属性・入れ子を保っているかを確かめるため。
// 移行が終わり index.html を削除するときに、このファイルも削除する。
//
//   node scripts/compare-legacy.mjs [作品ページの URL]
// ==========================================================
import { readFileSync, writeFileSync, mkdtempSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const url = process.argv[2] || 'http://film-portfolio.local/works/el-dorado/';

// 読み込みの仕組みが違う <script> <link> は比べない。
// テーマ内アセットの URL は相対パスに戻し、空行と行頭の空白を除く。
const normalize = (html) => html
  .replace(/<script\b[\s\S]*?<\/script>\s*/g, '')
  .replace(/<link\b[^>]*>\s*/g, '')
  .replace(/https?:\/\/[^"]*?\/wp-content\/themes\/[^/"]+\//g, '')
  .split('\n').map((l) => l.trim()).filter(Boolean).join('\n') + '\n';

const res = await fetch(url);
if (!res.ok) {
  console.error(`✗ ${url} が ${res.status} を返しました。`);
  process.exit(1);
}

const dir = mkdtempSync(join(tmpdir(), 'compare-legacy-'));
const legacy = join(dir, 'index.html');
const current = join(dir, 'wordpress.html');
writeFileSync(legacy, normalize(readFileSync('index.html', 'utf8')));
writeFileSync(current, normalize(await res.text()));

try {
  execFileSync('diff', ['-u', legacy, current], { stdio: 'inherit' });
  console.log('✓ 移行前の index.html と同じ HTML が出力されています。');
} catch {
  console.error('\n✗ 上の差分があります(- が移行前、+ が WordPress)。');
  process.exit(1);
}
