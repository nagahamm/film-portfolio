# デザイントークン

定義は `css/style.css` 冒頭の `DESIGN TOKENS` 節。ここが唯一の定義場所。
値そのものより **役割** で選ぶこと。

## Palette

| トークン | 値 | 役割 |
| :--- | :--- | :--- |
| `--ink` | `#171208` | 最も暗い面。ページ全体の地 |
| `--ink-2` | `#221a10` | 一段持ち上げた暗い面。カード・帯 |
| `--brown-dark` | `#2e2418` | さらに持ち上げた面。入れ子のカード |
| `--sand` | `#efe3c8` | 明るい面の主色。紙の質感 |
| `--sand-2` | `#e3d3ac` | 明るい面の副色。境目や沈めた領域 |
| `--paper` | `#faf5e8` | 最も明るい面 |
| `--rust` | `#b1531e` | 差し色。強調・アクティブ状態 |
| `--rust-dim` | `#8a4118` | 差し色の沈んだ側。ホバー後・押下 |
| `--rust-light` | `#c25f24` | 差し色の明るい側。暗い面の上での強調 |

#### 作品ごとの差し色

作品ごとに変えてよいのは `--rust` / `--rust-dim` / `--rust-light` の3つだけ。
`DESIGN TOKENS` 節の `:root` の直後に `.accent-<名前>{ --rust:…; --rust-dim:…; --rust-light:…; }` を足し、
`inc/accent.php` の選択肢に名前を足すと、管理画面の作品で選べるようになる。既定(`rust`)はクラスを付けない。
差し色を半透明で使うときは生の rgba を書かず、`color-mix(in srgb, var(--rust) N%, transparent)` にする
(rgba で書くと作品の差し色に追従しない)。
| `--gold` | `#ffcc00` | 最強のアクセント。ごく限定的に使う |

暗い面(`--ink` 系)と明るい面(`--sand` 系)を交互に積むのがこのサイトの基本リズム。
新しいセクションを足すときは前後のどちらでもない三つ目の面を作らない。

## Text

| トークン | 値 | 役割 |
| :--- | :--- | :--- |
| `--text-lo` | `#f4ead6` | 暗い面の上の本文 |
| `--text-lo-dim` | `#c9bda2` | 暗い面の上の補助・キャプション |
| `--text-hi` | `#211a10` | 明るい面の上の本文 |
| `--text-hi-dim` | `#5c5240` | 明るい面の上の補助・キャプション |
| `--text-on-media` | `#fff` | 画像・動画に直接重ねる文字 |
| `--link` | `#8c2e1d` | リンク |
| `--link-visited` | `#6b3e2e` | 訪問済みリンク |

面の明暗と `text-*` の組み合わせを取り違えるとコントラストが落ちる。面を変えたら文字色も必ず対で変える。

## Lines & scrims

| トークン | 役割 |
| :--- | :--- |
| `--line-lite` | 明るい面の罫線 |
| `--border-soft` / `--border-soft-strong` / `--border-soft-faint` | 暗い面の罫線。強調度で3段 |
| `--control-bg` | メディア上のボタンの地 |
| `--scrim` / `--scrim-strong` | メディアに重ねる暗幕。文字の可読性確保用 |

## Type

| トークン | 役割 |
| :--- | :--- |
| `--font-serif` | Shippori Mincho 700。見出し。フィルムのタイトル感を担う |
| `--font-sans` | Zen Kaku Gothic New 400/500/700。本文 |
| `--font-mono` | JetBrains Mono 400/500/700。日付・数値・メタデータ |

読み込みは `css/style.css` 1行目の `@import`。ウェイトを増やすときはここも更新する
(読み込んでいないウェイトを指定すると偽ボールドになる)。

## Metrics

| トークン | 値 | 役割 |
| :--- | :--- | :--- |
| `--header-height` | `3.875rem` | 固定ヘッダーの高さ |
| `--scroll-offset` | `header + 1.25rem` | アンカー着地位置。`scroll-padding-top` に使用 |
| `--wrap-max` | `57.5rem` | コンテンツの最大幅 |
| `--measure` | `37.5rem` | 本文カラムの可読幅。日本語の行長として調整済み |
| `--section-pad` | `6rem` | セクションの上下余白 |
| `--film-card-max` | `30rem` | 本編ポスターカードの最大幅 |
| `--radius-sm` / `--radius-md` | `0.25rem` / `0.5rem` | 角丸は2段のみ |

## Media aspect ratios

`--ratio-inline`(4:5)/ `--ratio-wide`(16:9)/ `--ratio-tall`(9:16)。
使い分けは CLAUDE.md の Media Aspect Ratio Rules が正。ここでは値だけを持つ。

## Motion

`--t-fast`(0.15s)/ `--t-base`(0.2s)/ `--t-slow`(0.7s)。
ホバー等の即応は fast、状態遷移は base、スクロール連動の演出は slow。
`prefers-reduced-motion: reduce` で無効化される前提で組む。

## Masonry

`--masonry-gutter` は `js/main.js` がピクセル値として読み取るため **px で定義する**。
CSS 側と JS 側の二重管理を避けるための唯一の定義であり、rem に変えてはいけない。

## Modal

| トークン | 役割 |
| :--- | :--- |
| `--modal-stage-h` | 枠の高さ。`@supports` で `vh` → `dvh` に差し替える |
| `--modal-close-size` / `--modal-arrow-size` | ボタンの寸法 |
| `--modal-btn-x` / `--modal-btn-y` | ボタンのオフセット。**符号だけで枠の内/外が切り替わる**(負=枠外/PC、正=枠内/モバイル) |
| `--modal-gutter` | 枠外ボタンが画面外に出ないための余白。上記2つから算出 |

モーダルのボタン位置を動かすときは個別セレクタではなく `--modal-btn-x/y` を変える。
位置基準は `.modal-frame`、比率の枠は `.modal-stage` と役割が分かれている
(`references/components.md` および `docs/design.md` を参照)。

### Instagram 埋め込みの幅

| トークン | 役割 |
| :--- | :--- |
| `--modal-embed-chrome` | 先方が iframe 内に描くヘッダー+フッターの高さ。**実測値** |
| `--modal-embed-min` | 埋め込みの最小幅(326px)。Instagram 側の下限 |
| `--modal-embed-max` | 上限(26rem) |
| `--modal-embed-w` | 上記から `clamp(min, (--modal-stage-h - chrome) * 9 / 16, max)` で算出 |

埋め込みは残った領域へ動画を 9:16 で収めるため、**動画の描画幅は高さ側から決まる**。
幅を固定値で置くと差がそのまま左右の黒帯になるので、高さから逆算する。
`--modal-embed-chrome` は Instagram 側 UI の実測値であり、先方のデザイン変更時は要調整。
