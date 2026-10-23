#!/usr/bin/env node
// ==========================================================
// リポジトリから Local のサイトを戻す(docs/design.md「手元の編集環境を戻す」)。
// Local で新しいサイト(film-portfolio.local)を作ったあとに1回実行する。
//   1. テーマ・uploads をリポジトリへのリンクにする
//   2. Local の nginx に動画の振り向けを足す
//   3. Secure Custom Fields・テーマを有効にし、パーマリンクを設定する
//   4. data/portfolio.sql を取り込む(作品があるサイトでは --force が無ければ止まる)
//   5. 手元に無いメディア(画像・PDF・動画)を R2 から取る
//
//   node scripts/restore.mjs [--force]
// ==========================================================
import { readFileSync, writeFileSync, existsSync, lstatSync, readlinkSync, readdirSync, rmSync, symlinkSync, mkdirSync, renameSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { dirname, join, resolve } from 'node:path';

const REPO = resolve(dirname(new URL(import.meta.url).pathname), '..');
process.chdir(REPO);
const netlify = readFileSync('netlify.toml', 'utf8');
const r2Video = netlify.match(/from\s*=\s*"\/assets\/videos\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];
const r2Upload = netlify.match(/from\s*=\s*"\/wp-content\/uploads\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];

const fail = (msg) => {
  console.error(`✗ ${msg}`);
  process.exit(1);
};
const step = (msg) => console.log(`— ${msg}`);

// Local のサイトに対する WP-CLI。capture なら標準出力を返す
const wp = (args, capture = false) => {
  const { status, stdout } = spawnSync(process.execPath, ['scripts/wp.mjs', ...args], { stdio: capture ? ['inherit', 'pipe', 'inherit'] : 'inherit', encoding: 'utf8' });
  if (status !== 0) fail(`wp ${args[0]} が失敗した(Local でサイトを起動しているか確認)`);
  return capture ? stdout.trim() : '';
};

const site = wp(['eval', 'echo ABSPATH;'], true);
const content = join(site, 'wp-content');

// --- 1. リンク --------------------------------------------
const link = (path, target) => {
  const stat = lstatSync(path, { throwIfNoEntry: false });
  if (stat) {
    if (stat.isSymbolicLink()) {
      if (readlinkSync(path) === target) return;
      rmSync(path); // 古い置き場所を指すリンク(リポジトリを移したときなど)
    } else if (readdirSync(path).every((f) => f === '.DS_Store')) {
      rmSync(path, { recursive: true });
    } else {
      fail(`${path} に中身がある。中身を確かめて退かしてから、もう一度実行する`);
    }
  }
  symlinkSync(target, path);
};
step('テーマと uploads をリポジトリへのリンクに');
link(join(content, 'themes/film-portfolio'), REPO);
link(join(content, 'uploads'), join(REPO, 'uploads'));

// --- 2. nginx の振り向け ---------------------------------
const conf = resolve(site, '../../conf/nginx/site.conf.hbs');
const nginx = readFileSync(conf, 'utf8');
if (!nginx.includes('location ^~ /assets/videos/')) {
  step('nginx に動画の振り向けを追加(Local でサイトを再起動すると効く)');
  const anchor = "\t#\n\t# Forward 404's to WordPress";
  if (!nginx.includes(anchor)) fail(`${conf} に追加する位置が見つからない。docs/design.md「メディアの配信」の振り向けを手で足す`);
  writeFileSync(conf, nginx.replace(anchor, `\t#
\t# 動画は手元のメディアライブラリから(本番では netlify.toml が R2 へ振り向ける。film-portfolio リポジトリ docs/design.md)
\t#
\tlocation ^~ /assets/videos/ {
\t\trewrite ^/assets/videos/(.*)$ /wp-content/uploads/$1 last;
\t}

${anchor}`));
}

// --- 3. プラグイン・テーマ・パーマリンク -----------------
step('Secure Custom Fields とテーマを有効に');
if (spawnSync(process.execPath, ['scripts/wp.mjs', 'plugin', 'is-active', 'secure-custom-fields'], { stdio: 'ignore' }).status !== 0) {
  wp(['plugin', 'install', 'secure-custom-fields', '--activate']);
}
wp(['theme', 'activate', 'film-portfolio']);

// --- 4. 本文 ----------------------------------------------
const works = Number(wp(['post', 'list', '--post_type=work', '--post_status=any', '--format=count'], true));
if (works > 0 && !process.argv.includes('--force')) {
  fail(`このサイトにはすでに作品が ${works} 件ある。data/portfolio.sql で上書きしてよければ --force を付けて実行する`);
}
step('data/portfolio.sql を取り込む');
wp(['db', 'import', join(REPO, 'data/portfolio.sql')]);
wp(['option', 'update', 'permalink_structure', '/%postname%/']);
wp(['rewrite', 'flush']);

// --- 5. メディア(画像・PDF・動画) -------------------------
const media = wp(['eval', 'foreach ( get_posts( [ "post_type" => "attachment", "post_status" => "inherit", "numberposts" => -1 ] ) as $p ) echo get_post_meta( $p->ID, "_wp_attached_file", true ), "\\n";'], true)
  .split('\n').filter(Boolean);
const missing = media.filter((path) => !existsSync(`uploads/${path}`));
for (const path of missing) {
  const video = path.endsWith('.mp4');
  const url = (video ? r2Video : r2Upload) + path;
  console.log(`R2 から  ${path}`);
  const res = await fetch(url).catch((e) => fail(`R2 に接続できない(${e.cause?.code ?? e.message})`));
  if (!res.ok) fail(`${path} が R2 に無い(${res.status})`);
  const body = Buffer.from(await res.arrayBuffer());
  if (body.length !== Number(res.headers.get('content-length'))) fail(`${path} を最後まで受け取れなかった`);
  mkdirSync(dirname(`uploads/${path}`), { recursive: true });
  writeFileSync(`uploads/${path}.part`, body);
  renameSync(`uploads/${path}.part`, `uploads/${path}`);
}
console.log(`✓ 戻しました(メディア ${media.length} 件のうち ${missing.length} 件を R2 から取得)。`);
console.log('  公開する前に npx netlify-cli login・npx netlify-cli link・npx wrangler@4 login を済ませる。');
