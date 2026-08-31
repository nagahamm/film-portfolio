# コンポーネント

`css/style.css` は `/* ===== 名前 ===== */` の区切りでページの登場順に並んでいる。
新しいスタイルは対応する節に書き、節をまたいで散らさない。

## セクション構成(登場順)

| id | 節 | 内容 |
| :--- | :--- | :--- |
| — | `HERO` | 冒頭 |
| `#watch` | `WATCH` | 本編ポスターカード / 数値カード / ショットリスト帯 |
| `#slate` | `SLATE` | Masonry の写真グリッド |
| `#craft` | `CRAFT` | 担当領域カード(Masonry + カルーセル) |
| `#onset` | `PAR TABLE` | Problem / Action / Result |
| `#process` | `TIMELINE / PROCESS` | 撮影回ごとの記録(`EPISODE LIST`) |
| `#materials` | `MATERIALS` | 制作資料 PDF |
| `#next` | `PAR TABLE` | Problem / Action |

## 使い回しているコンポーネント

同じものを2回書かない。新規で似たものが要るときは、まずこれらを流用できないか確かめる。

### カルーセル(`[data-carousel]`)
`.carousel-track` > `.carousel-slide` に、前後矢印とドットを添える。
Episode と Craft の両方で使う。JS は `[data-carousel]` を目印に初期化するので、
**マークアップを写すだけでは動かない。データ属性を必ず付ける。**
スライド内の動画は `.carousel-slide video` として個別に再生制御される。

### Masonry(`.masonry-grid`)
Slate と Craft で共用。`.masonry-sizer` を先頭に置く構造が前提。
桁は `--masonry-gutter` を JS がピクセル値で読む(`references/tokens.md` 参照)。

### PAR テーブル(`.par-table`)
On Set は Problem / Action / Result の3列、Next は Problem / Action の2列。
列数の違いは同じコンポーネントの変種として扱い、別クラスを作らない。

### 比較スライダー(`[data-compare]`)
Before / After。比率は `--ratio-inline`。キャプションは `.compare-caption`。
現在1箇所のみ。増やすときは JS の初期化が `[data-compare]` 走査であることを利用する。

### エピソード項目(`.ep-item`)
Process 内の小トピック。メディア枠は `.ep-media`、説明は `.ep-caption`。
動画を含む場合はミュートボタン(`.ep-video-mute`)をセットで置く(CLAUDE.md の Video Element Rules)。

### 担当領域カード(`.craft-card`)
`data-label` に領域名(`Director`, `Camera`, `Color`, `Edit`, `Acting`, `Props`,
`Script`, `Audio`, `AD`)を持つ。写真1枚なら `.has-photo` が付き、比率が
`data-label` ごとに切り替わる(CLAUDE.md の Media Aspect Ratio Rules)。

### モーダル(`.modal`)
`#img-modal` / `#video-modal` / `#film-modal` の3種。共通構造は
`.modal-bg` + `.modal-frame` > `.modal-btn` … + `.modal-stage` > `.modal-media`。
`.modal-stage` が比率の固定枠とボタンの位置基準を兼ねる。ここを起点に組む。

## JS が依存しているフック

CSS のクラス名を変えるときは、`js/main.js` が以下を直接見ていることを確認する。
クラス名のリネームは HTML / CSS / JS を同時に直して1コミットにまとめる。

- 状態クラス: `.fade`(スクロール連動の表示)
- データ属性: `[data-carousel]`, `[data-compare]`, `[data-album]`
- 要素セレクタ: `.masonry-grid`, `.shotlist-marquee`, `.ep-video-mute`,
  `.ep-media img`, `.ep-media video`, `.craft-card > img`, `.carousel-slide`

`.craft-card > img` は **直下の子** を見ている。カードの中に包む要素を1枚挟むと
モーダルが開かなくなる。
