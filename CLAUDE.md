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

## Project Conventions

1. **英語表記ルール(オーストラリア英語)**: カラーに関する単語はアメリカ英語(`color`)ではなく、オーストラリア/イギリス英語(`colour`)を必須とする。
   - 例: `colour`, `colour-correction`, `colour-grading`
2. **撮影セクションのメタデータ表記フォーマット**: 撮影回のヘッダー・キャプションは以下の統一フォーマットで記述する。
   - フォーマット: `撮影<番号>(<月>/<日>・<曜日>)(ロケ地: <ロケ地名> / クルー: <人数>名)`
   - 例: `撮影③(4/19・日)(ロケ地: Twin Falls / クルー: 2名)`
3. **特定キーワードの自動ハイパーリンク化**: 以下の単語がHTML本文中に登場する場合は、対応する制作資料PDFへのリンク(`<a>`タグ)を付与する。
   - 「ショットリスト」 → `assets/documents/2026-02-22__doc_02__shotlist.pdf`
   - 「香盤表」または「スケジュール」 → `assets/documents/2026-02-22__doc_03__schedule.pdf`
   - 「ロケハン」 → `assets/documents/2026-02-22__doc_01__location-scout.pdf`
   - 「持ち物リスト」または「パッキングリスト」 → `assets/documents/2026-02-22__doc_04__packing-list.pdf`
4. **ロケ地名のGoogle Mapsリンク化**: 本文やキャプションに「Cedar Creek Falls」「Twin Falls」「Gardner Falls」などのロケ地名が登場する場合は、該当場所のGoogle Maps検索URL(またはピン留めURL)への外部リンクを`target="_blank" rel="noopener noreferrer"`付きで設定する。

## Video Element Rules

1. **音声付き動画のデフォルト設定**: 音声が存在する動画を背景またはインライン再生する場合は、ブラウザの自動再生ポリシーに対応するため、デフォルトで `autoplay muted loop playsinline preload="metadata"` 属性を設定する。
2. **ミュート切り替えボタンの配置**: 音声付き動画要素には、ユーザーが手動で音声をON/OFFできるようにミュート切替ボタン(`.ep-video-mute` 等)を必ずセットで配置する。
3. **HTMLテンプレート構造(標準構成)**:
   ```html
   <video src="..." poster="..." autoplay muted loop playsinline preload="metadata"></video>
   <button class="ep-video-mute" aria-label="音声をオン/オフ" type="button">
     <svg class="icon-muted" viewBox="0 0 24 24" fill="none" stroke="#e8e0d0" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M11 5 6 9H3v6h3l5 4V5z"/><line x1="16" y1="9" x2="21" y2="15"/><line x1="21" y1="9" x2="16" y2="15"/></svg>
     <svg class="icon-unmuted" viewBox="0 0 24 24" fill="none" stroke="#e8e0d0" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M11 5 6 9H3v6h3l5 4V5z"/><path d="M15.5 8.5a5 5 0 0 1 0 7"/><path d="M18 6a9 9 0 0 1 0 12"/></svg>
   </button>
   ```

## Testing Policy

- 軽微な修正(ファイル名変更、UI調整、テキスト修正など)の際は不要なテスト実行をスキップし、明示的な指示または重要なロジック変更時のみテストを実行する。

## Git Commit Rules

Conventional Commits 規約(英語)に準拠。

- Header: `<type>(<scope>): <short summary>`
- Body: 変更点を箇条書き
