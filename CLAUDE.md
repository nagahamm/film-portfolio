# Project Guidelines: Film Portfolio (`film-portfolio`)

## Communication Rules

- **敬語・挨拶不要**: 丁寧な前置きや後置き、過剰な説明は排除する。
- **簡潔性・トークン節約**: 最小限の言葉で結論・変更内容・コードのみを的確に伝える。

## Tech Stack

- **HTML5**: セマンティックタグ優先、DOM階層はフラットに保つ。
- **CSS3**: Native CSS Custom Properties (`:root`), Grid (Subgrid), Flexbox
- **JavaScript**: ES6+ Vanilla JS

## Core Principles (SOLID, KISS, YAGNI, DRY)

1. **DRY**: 色・サイズ・ヘッダー高 (`--header-height`, `--scroll-offset`) は `:root` 変数で一元管理。重複スタイルは共通化。
2. **KISS**: 不要なネストを避け、CSSセレクタはフラットに保つ。
3. **YAGNI**: 未使用CSS、デッドコード、使われていないクラス・関数は即削除。
4. **SOLID**: HTML(構造)/CSS(装飾)/JS(制御)の完全分離(インラインスタイル禁止)。

## Constraints

- **Content Protection**: `index.html` 内の本文(日本語テキスト)は指定がない限り変更禁止。
- **Design Protection**: 既存の見た目・カラーバランス・トーン&マナーを崩さない。
- **Responsive**: モバイル(<= 768px)表示時は確実に縦積み(Flexbox)にし、PC用 Grid / Subgrid / 中央揃えを完全リセットする。

## Testing Policy

- 軽微な修正(ファイル名変更、UI調整、テキスト修正など)の際は不要なテスト実行をスキップし、明示的な指示または重要なロジック変更時のみテストを実行する。

## Git Commit Rules

Conventional Commits 規約(英語)に準拠。

- Header: `<type>(<scope>): <short summary>`
- Body: 変更点を箇条書き
