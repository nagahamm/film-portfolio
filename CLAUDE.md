# Project Guidelines: Film Portfolio (`film-portfolio`)

ショートフィルムの制作過程をまとめたポートフォリオサイト(1作品目「エル・ドラド」)。
手元の WordPress(Local)で作品を編集し、静的な HTML に書き出して Netlify から配信する。リポジトリ直下がそのまま WordPress のテーマ。

## 構成

| パス | 役割 |
| :--- | :--- |
| `front-page.php` / `single-work.php` / `404.php` | 作品一覧 / 作品ページ / 案内ページ |
| `header.php` / `footer.php` / `template-parts/` | 共通の頭と足、セクション(`section-*.php`)と部品(`part-*.php`) |
| `functions.php` / `inc/` | 投稿タイプ・出力の整理・読み込み・メディア・本文の自動リンク・差し色 |
| `acf-json/` | 作品の入力欄の定義(Secure Custom Fields) |
| `css/style.css` | 全スタイル。`:root` にトークンを集約 |
| `js/main.js` | モーダル、動画制御、カルーセル、比較スライダー |
| `netlify.toml` | 公開設定、動画の R2 リダイレクト、キャッシュ |
| `uploads/<作品>/` | 画像・動画・制作資料 PDF の原本(メディアライブラリ。中身は Git に入れない) |
| `data/portfolio.sql` | 作品の本文(投稿・入力欄・メディアの情報)の書き出し |
| `docs/requirements.md` | 要件定義(Gherkin)。利用者から見た振る舞い |
| `docs/design.md` | 詳細設計。構造・責務・配信の仕組み |
| `docs/work-log.md` | 作業時間の記録と集計 |
| `scripts/check.mjs` | 静的検証。`node scripts/check.mjs`(公開前は `--site`) |
| `scripts/sync-media.mjs` | メディアライブラリのうち R2 に無いもの(画像・PDF・動画)を R2 へ送る |
| `scripts/publish.sh` | メディアを R2 へ → 書き出し → 検証 → 本文の書き出し → Netlify へ公開 |
| `scripts/wp.mjs` | Local のサイトに対する WP-CLI |
| `scripts/restore.mjs` | git clone から Local のサイトを戻す(Local でサイトを作ったあとに1回。リンク・nginx・プラグイン・本文・メディア) |
| `.claude/skills/portfolio-design/` | デザインシステムと拡張手順 |

## Communication Rules

- **敬語・挨拶不要**: 丁寧な前置きや後置き、過剰な説明は排除する。
- **簡潔性・トークン節約**: 最小限の言葉で結論・変更内容・コードのみを的確に伝える。

## Interaction & Execution Policy（応答・自律実行ルール）

1. **作業中の細かい確認は行わない**: 着手後は「次に進めてよいか」等を挟まず、修正からGitコミットまで一括で完了させる。
2. **質問してよいタイミング**: 着手前の前提確認、指示が実装や既存ルールと矛盾する場合、判断不能な破壊的変更のリスクがある場合に限る。
3. **指示の範囲を超えない**: 作業中に気づいた別の改善点は、勝手に手を入れず報告に留める。実施するかは着手前に確認する。
4. **ブラウザ起動・自動テストは行わない**: 動作確認のためのブラウザ起動およびE2E等の自動テストは、実施も実施可否の確認も不要。静的な検証（構文チェック等）のみで完結させる。
5. **セッション管理(`/compact`, `/clear`)**: 細かい作業ごとに毎回リセットせず、文脈の異なる作業が5回程度重なった時点、または無関係なコンテキストが溜まった時点で `/clear` する。

## Development Workflow

思いつきで実装を始めない。**要件定義 → 設計 → 実装** の順序を守る。
本プロジェクトの実装は Claude Code が要件定義からコード・検証まで一貫して担う (AIDD)。
手順を飛ばして直接コードから着手しない。

0. **要件定義(BDD寄り) → 詳細設計(DDD寄り) → 実装(TDD寄り)**

   | 段階 | 成果物 | 内容 |
   | :--- | :--- | :--- |
   | 要件定義 | `docs/requirements.md` | 機能に関わる変更は、着手前に Gherkin 形式(Given/When/Then)のシナリオを追記・更新する。**利用者本人が読んで齟齬に気づけること**を優先し、実装用語ではなく振る舞いで書く |
   | 詳細設計 | `docs/design.md` | 構造・責務・配信に関わる変更は先にここを更新する。関心事(拡大表示のアルバム、メディア配信、レイヤの責務)を中心に据え、実装の都合で構造を歪めない |
   | 実装 | `scripts/check.mjs` | 検証可能な範囲は検査を用意し、**通してからコミットする**。厳密なTDDまでは求めないが、検証なしでの実装のみのコミットはしない |

   - 検査を追加できる変更(参照の追加、必須属性の追加、規約の追加)では、実装と同じコミットで `scripts/check.mjs` にも検査を足す。
   - 見た目・アニメーションなど目視でしか判断できない範囲は検査の対象外とし、無理に自動化しない。
   - 見た目の設計は `.claude/skills/portfolio-design/` が持つ。CSSを触る前に読む。
   - Issue は docs の該当シナリオ・該当箇所に言及してよいが、**docs の代わりにはならない**。Issue は「何をなぜやるか」の記録、`docs/` は「現在どうなっているか」の生きたドキュメント。

1. **Issue駆動**: 今後の変更（機能追加・不具合修正・UI調整）は、まずIssueを立ててから着手する。Issueには現象・原因・対応案を記載する。
2. **ブランチ**: `main` へ直接コミットせず、作業ブランチで進めてPull Requestを経由する。コミットメッセージに `Closes #<番号>` を含め、マージ時にIssueが閉じるようにする。
3. **リリースタグ**: **不具合修正が完了したとき、および機能を追加したときは、`main` へマージした後に必ずタグを打つ。** セマンティックバージョニング(`vMAJOR.MINOR.PATCH`)に従う。

   | 区分 | 上げる桁 | 例 |
   | :--- | :--- | :--- |
   | 不具合修正・軽微なUI調整 | PATCH | `v1.0.0` → `v1.0.1` |
   | 機能追加・セクション追加 | MINOR | `v1.0.1` → `v1.1.0` |
   | 構成やデザインの全面刷新 | MAJOR | `v1.1.0` → `v2.0.0` |

   - タグは作業ブランチではなく、マージ後の `main` の最新コミットに打つ。
   - 注釈付きタグ(`-a`)とし、メッセージに変更点を箇条書きで残す。
   - 複数のIssueをまとめてマージした場合も、リリース単位で1つのタグにする。

   ```bash
   git checkout main && git pull
   git tag -a v1.0.1 -m "v1.0.1 — <変更の要約>"
   git push origin v1.0.1
   ```

4. **作業時間の記録**: 作業ごとに `docs/work-log.md` の内訳へ1行(時間・区分・詰まったところ)足し、記録と集計も更新する。同じコミットに含め、記録だけのコミットは作らない。
   - 時間は会話ログ(`~/.claude/projects/-Users-cygnu-Desktop-film-portfolio/*.jsonl`。2026-10-17 にリポジトリを移す前の分は `-Users-cygnu-Documents-film-portfolio`)の指示の時刻からコミット直前までで測る。推測しない。

## Tech Stack

- **HTML5**: セマンティックタグ優先、DOM階層はフラットに保つ。
- **CSS3**: Native CSS Custom Properties (`:root`), Grid (Subgrid), Flexbox
- **JavaScript**: ES6+ Vanilla JS
- **WordPress**(Local、PHP 8.2)+ Secure Custom Fields。WordPress は手元にだけ置き、本番には持ち込まない。
- 本番はビルド工程もサーバー処理も持たない静的サイト。`scripts/publish.sh` で書き出して Netlify へ送る。設定は `netlify.toml` に集約する。

## Core Principles (SOLID, KISS, YAGNI, DRY)

1. **DRY**: 色・寸法・フォント・モーション等の値は `:root` のトークンで一元管理する。同じ値を2箇所以上に書かない。JSとCSSで同じ値が必要な場合は、CSS変数を定義元としてJSから読み出す。
2. **KISS**: 不要なネストを避け、CSSセレクタはフラットに保つ。
3. **YAGNI**: 未使用CSS、デッドコード、使われていないクラス・関数は即削除。
4. **SOLID**: HTML(構造)/CSS(装飾)/JS(制御)の完全分離。インラインスタイル禁止。JSからは class / 属性の切り替えのみを行い、`style` プロパティを直接触らない。

## Constraints

- **Content Protection**: 作品の本文(管理画面の入力値、`data/portfolio.sql`)は指定がない限り変更禁止。文言の言い換えも不可。
- **Design Protection**: 既存の見た目・カラーバランス・トーン&マナーを崩さない。
- **Responsive**: ブレークポイントは `48em`(≒768px)と `30em`(≒480px)の2つのみ。3つ目を作らない。`48em` 以下では Grid / Subgrid / 中央揃えを完全にリセットして縦積み(Flexbox)にする。新しいコンポーネントを足したら `RESPONSIVE` 節にも縦積みの指定を書く。

## Content Conventions

1. **英語表記(オーストラリア英語)**: カラーに関する語はアメリカ英語(`color`)ではなく英/豪表記(`colour`)を使う。
   - 例: `colour`, `colour-correction`, `colour-grading`
   - 例外: CSSプロパティ名・JSのAPI名は言語仕様どおり `color` を使う。
2. **撮影セクションのメタデータ表記**: 撮影回のヘッダー・キャプションは以下で統一する。括弧の前にスペースを入れない。
   - フォーマット: `撮影<番号>(<月>/<日>・<曜日>)(ロケ地: <ロケ地名> / クルー: <人数>名)`
   - 例: `撮影⑥(4/19・日)(ロケ地: Twin Falls / クルー: 2名)`
3. **本文中の特定語の自動リンク化**: 以下の語が本文・キャプションに登場したらリンクを付与する。リンクは入力させず、`inc/autolink.php` が出力時に付ける(辞書は Instagram、作品の「ロケ地」、資料カードの「リンク語」)。

   | 語 | リンク先 |
   | :--- | :--- |
   | ショットリスト | `#shotlist` |
   | 香盤表 / スケジュール | `#schedule` |
   | ロケハン | Materialsのロケハンカード(**現状アンカー・リンク語とも未設定**。リンクするときはカードに入れる) |
   | 持ち物リスト / パッキングリスト | Materialsの持ち物リストカード(同上) |
   | ロケ地名(Cedar Creek Falls, Twin Falls, Gardners Falls 等) | 該当地の Google Maps URL |
   | Instagram | `https://www.instagram.com/nagahamm_film` |

   - 制作資料はPDFへ直リンクせず、Materialsセクションの該当カードへアンカーで飛ばす。PDFの実体パスはカード側が唯一の定義元となる。
   - 外部リンクには `target="_blank" rel="noopener"` を付ける。
   - ページ内アンカーには `.inline-link` を付ける。外部リンクは、リンク色をセクション側で持たない暗背景のセクション(Approach・Next・Craft)でだけ付ける(`fp_text()` の第2引数)。
4. **アセット命名**: `YYYY-MM-DD__<種別>_<連番2桁>__<slug>.<ext>` で統一する。種別は `cam`(撮影素材) / `bts`(メイキング) / `loc`(ロケ地) / `scr`(画面キャプチャ) / `doc`(資料)。ファイル名は小文字だけで書き、未確定の番号は小文字の `x` で仮置きする(連番なら `xx`。例: `2026-08-03__cam_xx__shot-09-x-x.jpg`)。アップロード前のファイル名で守る。`/wp-content/uploads/*` は1年キャッシュしているため、**内容を差し替えるときはファイル名も必ず変える**(同名で上げると WordPress が連番を付ける)。
5. **キャプション規則**: 画像・動画キャプション(`.ep-caption`, `.compare-caption`)の文末に句点(`。`)を置かない。
6. **記号**:
   - 区切りのダッシュは `—`(エムダッシュ, U+2014)。`―` 等の類似記号は使わない。
   - 日本語本文中の強調は `「」`。`""` は使わない。
   - 三点リーダーは `…`(U+2026)。`...` は使わない。

## 撮影スケジュール・マッピング(Shoot Schedule Mapping)

| 撮影番号 | 日程 | ロケ地 | クルー |
| :--- | :--- | :--- | :--- |
| カメラテスト① | 1/28・水 | — | 3 |
| カメラテスト② | 2/22・日 | — | 3 |
| 撮影① | 2/28・土 | Cedar Creek Falls | 4 |
| 撮影② | 3/14・土 | Gardners Falls | 2 |
| 撮影③ | 3/22・日 | Twin Falls | 4→3 |
| 撮影④ | 4/2・木 | Cedar Creek Falls | 3 |
| 撮影⑤ | 4/10・金 | Cedar Creek Falls | 2 |
| 再ロケハン | 4/11・土 | Mooloolaba Beach | 1 |
| 撮影⑥ | 4/19・日 | Twin Falls | 2 |
| 撮影⑦ | 5/2・土 | — | 2 |
| 撮影⑧ | 5/3・日 | Mooloolaba Beach | 3 |
| 撮影⑨ | 5/21・木 | — | 2 |
| 撮影⑩ | 5/28・木 | — | 2 |

- 撮影番号と日程の不一致を防ぐため、作品の入力欄(Process)の撮影回・日程・ロケ地表記を修正する際は必ず本マップと照合する。

## Media Rules

### メディアアセット(画像・PDF・動画)

1. **置き場所**: 管理画面からメディアライブラリ(`uploads/<作品の slug>/`)へ上げ、入力欄で選ぶ。**中身は Git に入れない**(`.gitignore` の `uploads/**/*`)。正本は Cloudflare R2(バケット `film-portfolio-videos`)。
2. **配信**: `scripts/publish.sh` の最初に `scripts/sync-media.mjs` が、R2 に無いもの・サイズが違うものを送る。初回は `npx wrangler@4 login` が必要。
   - 画像・PDF → R2 `uploads/<slug>/`。ページ上の URL は `/wp-content/uploads/<slug>/<file>`。`netlify.toml` が R2 へ 302。
   - 動画 → R2 `videos/<slug>/`。テンプレートの `fp_video()` が `/assets/videos/<slug>/<file>` を出力。`netlify.toml` が R2 へ 302。Local では nginx が手元の uploads へ振り向ける。
   - リダイレクトは種類ごとにワイルドカード1本なので、ファイルを足しても `netlify.toml` は変えない。
3. **動画のエンコード**: `H.264`(映像) + `AAC`(音声)に統一する(HEVC/ProResは不可)。変換例: `ffmpeg -i input.mp4 -vcodec libx264 -acodec aac output.mp4`。H.264 でない動画があれば sync が止まる。
4. **poster**: **インライン動画**には `poster` を必須指定する。ポスターはその動画から抽出したフレームを使い、`<動画と同じベース名>-poster.jpg` としてメディアライブラリに上げる。抽出例: `ffmpeg -i video.mp4 -ss 00:00:00.5 -vframes 1 poster.jpg`
   - モーダルの `#modal-video-player` は開いた瞬間に再生するため poster 不要。属性も `controls playsinline preload="metadata"` のみ。

### 再生の挙動

1. **ページ上(インライン)**: `autoplay muted loop playsinline preload="metadata"` で開始し、画面内に入った動画だけを再生する。クリックで再生/一時停止を切り替えられるようにする。
2. **モーダル**: クリックで開いた時点から音ありで再生する(開く操作がユーザー操作にあたるため自動再生ポリシーに抵触しない)。ミュート状態はモーダル内で引き継ぎ、一度ミュートしたら次に開く動画もミュートで始める。
3. **音量UI**: 音量調整は端末/OSの物理ボタンに委ね、独自の音量バーは置かない。
4. **ミュートボタン**: 音声あり動画にはミュート切替ボタン(`.ep-video-mute`)をセットで置く。無声動画には置かない。動画の音声トラックの有無で自動で出し分ける(無声動画は音声トラックを消してから上げる)。マークアップの定義元は `template-parts/part-mute-button.php`(アイコンSVGを含む)。

### 縦横比

1. **ページ上(インライン)**: 縦スクロール量を抑えるため、既定は `aspect-ratio: 4 / 5` + `object-fit: cover`。
   - 例外「Camera」(`[data-label="Camera"]`): Blackmagicのスクリーンショットを切らずに見せるため、実アセットの比率(644/1400)を使う。
   - 例外「Color」「Edit」(`[data-label="Color"]`, `[data-label="Edit"]`): 横型の編集画面のため `16 / 9`。
2. **モーダル(拡大表示)** ※マスト要件:
   - メディアの実寸(`naturalWidth`/`naturalHeight`、`videoWidth`/`videoHeight`)をJSで判定し、縦構図(幅 ≤ 高さ)は `9 / 16`(`.is-portrait-modal`)、横構図(幅 > 高さ)は `16 / 9`(`.is-landscape-modal`)を `.modal-stage` に適用する(`object-fit: cover`)。
   - ×ボタン・左右矢印の位置基準は `.modal-frame` が持ち、比率とは分離する。枠幅はアルバム内で最も横に広いメディアに合わせ、前後送りでボタンが動かないようにする。
   - 比率の値は `:root` の `--ratio-*` トークンを定義元とする。

## Git Commit Rules

Conventional Commits 規約(英語)に準拠。

- Header: `<type>(<scope>): <short summary>`
- Body: 変更点を箇条書き(日本語可)

### コミット粒度(タスク単位で分割)

1. **1コミット=1タスク**: 「なぜこの変更をしたか」の理由が1つで説明しきれる単位に分割する。複数の目的が混ざったコミットは作らない。
   - 性質の異なる変更(バグ修正 / リファクタリング / 新機能 / パフォーマンス / ドキュメント)は、同じファイルを触る場合でも必ず別コミットに分ける。
   - 逆に、機械的に連動する変更(例: クラス名リネームに伴う HTML・CSS・JS の同時修正)は1コミットにまとめてよい。ファイル単位ではなくタスク単位で判断する。
2. **各コミットが単体で成立すること**: どのコミット時点でチェックアウトしてもページが壊れず、構文エラーが無い状態を保つ。「次のコミットで直る」前提の中間状態を残さない。
3. **バグ修正を先、リファクタリングを後**: 両方を行う場合は、原因と対処が追える順に並べる。リファクタリングの巨大な差分に埋もれさせない。
4. **大きな作業は着手前に分割方針を決める**: 全面的な書き換えやリファクタリングでは、作業前にコミットの分割単位を決めてから進める。後から分割し直す手戻りを防ぐ。
5. **`git commit --amend` の使い分け**: 直前のコミットの修整・補足であれば amend で統合する。新規作業がそれに該当する場合は、着手前にamendするかを提案する。別タスクであれば必ず新規コミットにする。
