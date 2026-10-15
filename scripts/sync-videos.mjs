#!/usr/bin/env node
// ==========================================================
// メディアライブラリの動画(uploads/<作品の slug>/*.mp4)のうち、R2 に無いもの・
// サイズが違うものを R2 の videos/<作品の slug>/ へ送る(docs/design.md「メディアの配信」)。
// 送る前に映像が H.264 かを確かめ、違えば何も送らずに止まる。R2 から消すことはしない。
// scripts/publish.sh が最初に実行する。
//
//   node scripts/sync-videos.mjs
// ==========================================================
import { readFileSync, readdirSync, statSync } from 'node:fs';
import { execFileSync, spawnSync } from 'node:child_process';

const BUCKET = 'film-portfolio-videos';
const netlify = readFileSync('netlify.toml', 'utf8');
const r2 = netlify.match(/from\s*=\s*"\/assets\/videos\/\*"\s*to\s*=\s*"([^"]+):splat"/)[1];

const fail = (msg) => {
  console.error(`✗ ${msg}`);
  process.exit(1);
};

const videos = readdirSync('uploads', { withFileTypes: true })
  .filter((e) => e.isDirectory())
  .flatMap((d) => readdirSync(`uploads/${d.name}`).filter((f) => f.endsWith('.mp4')).map((f) => `${d.name}/${f}`));

// R2 に無い・サイズが違うものだけ
const pending = [];
for (const path of videos) {
  const res = await fetch(r2 + path, { method: 'HEAD' }).catch((e) => fail(`R2 に接続できない(${e.cause?.code ?? e.message})`));
  if (!res.ok || Number(res.headers.get('content-length')) !== statSync(`uploads/${path}`).size) pending.push(path);
}

// CLAUDE.md「動画アセット」: 映像は H.264
for (const path of pending) {
  let codec;
  try {
    codec = execFileSync('ffprobe', ['-v', 'error', '-select_streams', 'v:0', '-show_entries', 'stream=codec_name', '-of', 'csv=p=0', `uploads/${path}`], { encoding: 'utf8' }).trim();
  } catch (e) {
    fail(e.code === 'ENOENT' ? 'ffprobe が見つからない(brew install ffmpeg)' : `uploads/${path}: 動画として読めない`);
  }
  if (codec !== 'h264') fail(`uploads/${path}: 映像が H.264 ではない(${codec})。ffmpeg -i <元> -vcodec libx264 -acodec aac <先> で変換し、別の名前で上げ直す`);
}

for (const path of pending) {
  console.log(`R2 へ  ${path}`);
  const { status } = spawnSync('npx', ['-y', 'wrangler@4', 'r2', 'object', 'put', `${BUCKET}/videos/${path}`, '--file', `uploads/${path}`, '--content-type', 'video/mp4', '--remote'], { stdio: 'inherit' });
  if (status !== 0) fail(`${path} を R2 へ送れなかった(未ログインなら npx wrangler@4 login)`);
}
console.log(`✓ 動画 ${videos.length} 本のうち ${pending.length} 本を R2 へ送りました。`);
