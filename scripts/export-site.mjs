#!/usr/bin/env node
// ==========================================================
// Local の WordPress を巡回し、公開用の静的ファイルを site/ に書き出す。
// トップ(作品一覧)から同じサイト内のリンクをたどり、ページと、
// ページが参照する CSS・JS・画像・PDF を保存する。URL はルートからの
// 相対パス(/…)に置き換えるので、どのドメインで公開しても動く。
// 動画(/assets/videos/*)は R2 から配信するため書き出さない。
//
//   node scripts/export-site.mjs [Local のサイトの URL]
// ==========================================================
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';

const origin = (process.argv[2] || 'http://film-portfolio.local').replace(/\/$/, '');
const OUT = 'site';
const NOT_FOUND = '/__export-not-found__/';

rmSync(OUT, { recursive: true, force: true });

const fail = (msg) => {
  console.error(`✗ ${msg}`);
  process.exit(1);
};

// 同じサイト内の URL をルート相対のパスにする。外部・動画・ページ内アンカーは null
const local = (url, base) => {
  if (url.startsWith('#') || url.startsWith('mailto:')) return null;
  const u = new URL(url.replaceAll('&amp;', '&'), base);
  if (u.origin !== origin || u.pathname.startsWith('/assets/videos/')) return null;
  return u.pathname;
};

const save = (path, body) => {
  const file = join(OUT, path.endsWith('/') ? `${path}index.html` : path);
  mkdirSync(dirname(file), { recursive: true });
  writeFileSync(file, body);
};

const pages = ['/'];
const assets = new Set();

for (let i = 0; i < pages.length; i++) {
  const path = pages[i];
  const res = await fetch(origin + path);
  if (!res.ok) fail(`${path} が ${res.status} を返した`);
  let html = await res.text();

  for (const [, url] of html.matchAll(/(?:href|src|poster|data-src)=["']([^"']+)["']/g)) {
    const p = local(url, origin + path);
    if (!p) continue;
    if (p.endsWith('/') && !pages.includes(p)) pages.push(p);
    else if (!p.endsWith('/')) assets.add(p);
  }
  save(path, html.replaceAll(origin, ''));
  console.log(`page   ${path}`);
}

// 案内ページは存在しない URL の応答をそのまま 404.html にする(Netlify が自動で使う)
{
  const res = await fetch(origin + NOT_FOUND);
  if (res.status !== 404) fail(`存在しない URL が ${res.status} を返した`);
  const html = await res.text();
  for (const [, url] of html.matchAll(/(?:href|src)=["']([^"']+)["']/g)) {
    const p = local(url, origin + NOT_FOUND);
    if (p && !p.endsWith('/')) assets.add(p);
  }
  save('/404.html', html.replaceAll(origin, ''));
  console.log('page   /404.html');
}

for (const path of [...assets].sort()) {
  const res = await fetch(origin + path);
  if (!res.ok) fail(`${path} が ${res.status} を返した`);
  save(path, Buffer.from(await res.arrayBuffer()));
}
console.log(`asset  ${assets.size} 件`);
console.log(`✓ ${OUT}/ に書き出しました。`);
