#!/usr/bin/env node
// ==========================================================
// メディアライブラリ(uploads/<作品の slug>/*)のうち、R2 に無いもの・
// サイズが違うものを R2 へ送る(docs/design.md「メディアの配信」)。
//   動画 → videos/<作品の slug>/  (送る前に H.264 を確認)
//   画像・PDF → uploads/<作品の slug>/
// R2 から消すことはしない。scripts/publish.sh が最初に実行する。
//
//   node scripts/sync-media.mjs
// ==========================================================
import { readFileSync, readdirSync, statSync } from 'node:fs';
import { extname } from 'node:path';
import { execFileSync, spawnSync } from 'node:child_process';

const BUCKET = 'film-portfolio-videos';
const netlify = readFileSync('netlify.toml', 'utf8');
const r2Video = netlify.match(/from\s*=\s*"\/assets\/videos\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];
const r2Upload = netlify.match(/from\s*=\s*"\/wp-content\/uploads\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];

const TYPES = {
  '.mp4': 'video/mp4',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.png': 'image/png',
  '.webp': 'image/webp',
  '.gif': 'image/gif',
  '.pdf': 'application/pdf',
};

const fail = (msg) => {
  console.error(`✗ ${msg}`);
  process.exit(1);
};

const files = readdirSync('uploads', { withFileTypes: true })
  .filter((e) => e.isDirectory())
  .flatMap((d) => readdirSync(`uploads/${d.name}`)
    .filter((f) => !f.startsWith('.') && TYPES[extname(f).toLowerCase()])
    .map((f) => `${d.name}/${f}`));

const pending = [];
for (const path of files) {
  const video = path.endsWith('.mp4');
  const url = (video ? r2Video : r2Upload) + path;
  const res = await fetch(url, { method: 'HEAD' }).catch((e) => fail(`R2 に接続できない(${e.cause?.code ?? e.message})`));
  if (!res.ok || Number(res.headers.get('content-length')) !== statSync(`uploads/${path}`).size) pending.push(path);
}

for (const path of pending.filter((p) => p.endsWith('.mp4'))) {
  let codec;
  try {
    codec = execFileSync('ffprobe', ['-v', 'error', '-select_streams', 'v:0', '-show_entries', 'stream=codec_name', '-of', 'csv=p=0', `uploads/${path}`], { encoding: 'utf8' }).trim();
  } catch (e) {
    fail(e.code === 'ENOENT' ? 'ffprobe が見つからない(brew install ffmpeg)' : `uploads/${path}: 動画として読めない`);
  }
  if (codec !== 'h264') fail(`uploads/${path}: 映像が H.264 ではない(${codec})。ffmpeg -i <元> -vcodec libx264 -acodec aac <先> で変換し、別の名前で上げ直す`);
}

for (const path of pending) {
  const video = path.endsWith('.mp4');
  const key = `${video ? 'videos' : 'uploads'}/${path}`;
  const type = TYPES[extname(path).toLowerCase()];
  console.log(`R2 へ  ${key}`);
  const { status } = spawnSync('npx', ['-y', 'wrangler@4', 'r2', 'object', 'put', `${BUCKET}/${key}`, '--file', `uploads/${path}`, '--content-type', type, '--remote'], { stdio: 'inherit' });
  if (status !== 0) fail(`${path} を R2 へ送れなかった(未ログインなら npx wrangler@4 login)`);
}
console.log(`✓ メディア ${files.length} 件のうち ${pending.length} 件を R2 へ送りました。`);
