<!-- 3つのモーダルは同一構造: .modal > .modal-bg + .modal-frame > .modal-stage
     .modal-frame … 比率によらず常に同じ寸法。×ボタン・左右矢印の位置基準
     .modal-stage … 表示中メディアの縦横比(9:16 / 16:9)だけを担う枠
     基準を分けることで、縦構図と横構図を行き来してもボタンが動かない。 -->
<div id="film-modal" class="modal" role="dialog" aria-modal="true" aria-label="本編「エル・ドラド」の再生" aria-hidden="true">
  <div class="modal-bg"></div>
  <div class="modal-frame is-embed-modal">
    <button type="button" class="modal-btn modal-close" id="close-film-modal" aria-label="閉じる">&times;</button>
    <div class="modal-stage">
      <iframe id="film-embed" class="modal-embed" title="ショートフィルム「エル・ドラド」(Instagram)" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
  </div>
</div>

<div id="video-modal" class="modal" role="dialog" aria-modal="true" aria-label="動画の拡大表示" aria-hidden="true">
  <div class="modal-bg"></div>
  <div class="modal-frame">
    <button type="button" class="modal-btn modal-close" id="close-video-modal" aria-label="閉じる">&times;</button>
    <button type="button" class="modal-btn modal-arrow modal-arrow-prev" id="video-modal-prev" aria-label="前の動画">‹</button>
    <div class="modal-stage">
      <video id="modal-video-player" class="modal-media" src="<?php fp_asset( 'videos/2026-08-03_cam_04_prod.mp4' ); ?>" controls playsinline preload="metadata"></video>
    </div>
    <button type="button" class="modal-btn modal-arrow modal-arrow-next" id="video-modal-next" aria-label="次の動画">›</button>
  </div>
</div>

<div id="img-modal" class="modal" role="dialog" aria-modal="true" aria-label="画像の拡大表示" aria-hidden="true">
  <div class="modal-bg"></div>
  <div class="modal-frame">
    <button type="button" class="modal-btn modal-close" id="close-img-modal" aria-label="閉じる">&times;</button>
    <button type="button" class="modal-btn modal-arrow modal-arrow-prev" id="img-modal-prev" aria-label="前の画像">‹</button>
    <div class="modal-stage">
      <img id="img-modal-image" class="modal-media" alt="">
    </div>
    <button type="button" class="modal-btn modal-arrow modal-arrow-next" id="img-modal-next" aria-label="次の画像">›</button>
  </div>
</div>
