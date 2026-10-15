#!/bin/sh
# ==========================================================
# 公開の手順を1本にまとめたもの(docs/design.md「書き出しと公開」)。
#   1. R2 に無い動画を R2 へ送る
#   2. Local の WordPress を site/ に書き出す
#   3. 書き出し結果を検証する(失敗したらここで止まる)
#   4. 本文を data/portfolio.sql に書き出す
#   5. site/ を Netlify へ公開する
#
#   scripts/publish.sh            公開まで行う
#   scripts/publish.sh --dry-run  5 の手前で止める(確認用。1 の動画は送る)
#
# 終わったら uploads/ と data/portfolio.sql の変更をコミットする。
# ==========================================================
set -eu
cd "$(dirname "$0")/.."

node scripts/sync-videos.mjs
node scripts/export-site.mjs
node scripts/check.mjs --site
scripts/export-content.sh

if [ "${1:-}" = "--dry-run" ]; then
  echo "--dry-run: 公開せずに終了しました。"
  exit 0
fi

npx -y netlify-cli deploy --prod --dir=site
echo "公開しました。uploads/ と data/portfolio.sql の変更をコミットしてください。"
