# Project Guidelines: Film Portfolio (`film-portfolio`)

## Communication Rules

- **敬語・挨拶不要**: 丁寧な前置きや後置き、過剰な説明は排除する。
- **簡潔性・トークン節約**: 最小限の言葉で結論・変更内容・コードのみを的確に伝える。

## Interaction & Execution Policy（応答・自律実行ルール）

1. **作業開始後の不要な途中質問・確認の禁止**: 作業進行中は「次に進めてよいか」等の細かな確認を行わず、修正・テスト・Gitコミットまでを一括で自律的に実行完了すること。
2. **質問を許可するタイミング**: 作業着手前の前提確認、または予期せぬ破壊的変更のリスクがあり判断が不可能な場合のみとする。
3. **トークン・セッション管理(`/compact`, `/clear`)**: `/compact` および `/clear` を積極的に活用すること。1つの細かい作業ごとに毎回リセットするのではなく、文脈の異なる作業が5回程度重なったタイミングや、無関係なコンテキストが溜まった段階で `/clear` でセッションをリセットすること。
4. **Gitコミットの結合提案(`git commit --amend`)**: 新規作業に着手する際、その内容が直前のコミットの修整・補足・関連作業である場合は、作業前に「直前のコミットと統合するために `git commit --amend` を使用するか」を提案すること。
5. **ブラウザ起動・自動テストの禁止**: 確認作業時にブラウザの立ち上げや自動ブラウザテスト(E2E等)の実行確認を聞いてこないこと。ブラウザを立ち上げてのテストは原則不要とし、完全に省略すること。

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
5. **Instagramの自動ハイパーリンク化**: 本文中に「Instagram」という単語が登場する場合は、該当のInstagramアカウント(`https://www.instagram.com/nagahamm_film`)への外部リンク(`target="_blank" rel="noopener"`)を付与する。
6. **キャプション規則**: 画像・動画キャプション(`.ep-caption`, `.compare-caption`)の文末には句点(`。`)を配置しない。

## Typography & Formatting Rules

1. **ダッシュ記号**: 区切りには `—`(エムダッシュ, U+2014)を使用する(`―`等の類似記号は使用しない)。
2. **撮影回ラベルの括弧**: 撮影回ラベルの括弧前にはスペースを入れない(例: `撮影①(...)`)。
3. **強調の引用符**: 日本語本文中の強調には `「」` を使用し、`""` は使用しない。
4. **三点リーダー**: 三点リーダーには半角ピリオド連続(`...`)ではなく `…`(U+2026)を使用する。

## Video Element Rules

1. **エンコード & ポスター仕様**:
   - コーデック: ブラウザ互換性確保のため `H.264`(映像)+ `AAC`(音声)に統一する(HEVC/ProResは使用不可)。既存ファイルがHEVC等の場合は `ffmpeg -i input.mp4 -vcodec libx264 -acodec aac output.mp4` 等で変換する。
   - poster属性: 全 `<video>` に `poster="<動画と同じベース名>-poster.jpg"` を必須指定する。ポスター画像は原則としてその動画自体から抽出したフレーム(例: `ffmpeg -i video.mp4 -vframes 1 -ss 00:00:00.5 poster.jpg`)を使用する。
2. **基本HTML構造 & 属性**: デフォルト属性として `autoplay muted loop playsinline preload="metadata"` を設定する。
3. **再生・停止コントロール(Play / Pause)**: 自動再生(ミュート)で開始しつつ、動画クリック等でユーザーが任意に「再生 / 一時停止」を制御可能にする。
4. **音声・ミュートコントロール**:
   - 音量調整は端末/OSの物理音量ボタンに委ねるため、独自の音量バーUIは配置しない。
   - **音声あり動画**: ミュート切替ボタン(`.ep-video-mute`)をセットで配置する。
   - **無声動画**: ミュート切替ボタンは配置・表示しない。
5. **HTMLテンプレート構造(音声あり動画の標準構成)**:
   ```html
   <video src="..." poster="..." autoplay muted loop playsinline preload="metadata"></video>
   <button class="ep-video-mute" aria-label="音声をオン/オフ" type="button">
     <svg class="icon-muted" viewBox="0 0 24 24" fill="none" stroke="#e8e0d0" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M11 5 6 9H3v6h3l5 4V5z"/><line x1="16" y1="9" x2="21" y2="15"/><line x1="21" y1="9" x2="16" y2="15"/></svg>
     <svg class="icon-unmuted" viewBox="0 0 24 24" fill="none" stroke="#e8e0d0" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M11 5 6 9H3v6h3l5 4V5z"/><path d="M15.5 8.5a5 5 0 0 1 0 7"/><path d="M18 6a9 9 0 0 1 0 12"/></svg>
   </button>
   ```

## Automated Testing Policy

- **自動テストの事前確認ポリシー**:
  - このプロジェクトにおいて、自動テストは原則として【不要】とする。
  - もし自動テストの実行が必要だと判断される場合であっても、勝手に実行せず、必ず【実行前にユーザーへテストを行うか確認(質問)】すること。

## Git Commit Rules

Conventional Commits 規約(英語)に準拠。

- Header: `<type>(<scope>): <short summary>`
- Body: 変更点を箇条書き
