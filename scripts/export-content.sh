#!/bin/sh
# ==========================================================
# 本文(作品・入力欄・メディアの情報)をデータベースから data/portfolio.sql に書き出す。
# リポジトリが公開のため、ユーザー・設定などのテーブルは書き出さない(docs/design.md)。
# 差分を読めるよう、日時を入れず1行1レコードで書き出す。
# ==========================================================
set -eu
cd "$(dirname "$0")/.."
mkdir -p data

TABLES=$(node scripts/wp.mjs db tables '*_posts' '*_postmeta' '*_term*' --format=csv)
node scripts/wp.mjs db export "$PWD/data/portfolio.sql" --tables="$TABLES" \
  --skip-dump-date --skip-extended-insert --no-tablespaces=true
