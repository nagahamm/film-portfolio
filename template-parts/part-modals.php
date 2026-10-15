<?php
/**
 * 拡大表示の3つのモーダル。本編は作品の基本項目から作る。
 */

$work = get_queried_object_id();
?>
<!-- 3つのモーダルは同一構造: .modal > .modal-bg + .modal-frame > .modal-stage
     .modal-frame … 比率によらず常に同じ寸法。×ボタン・左右矢印の位置基準
     .modal-stage … 表示中メディアの縦横比(9:16 / 16:9)だけを担う枠
     基準を分けることで、縦構図と横構図を行き来してもボタンが動かない。 -->
<div id="film-modal" class="modal" role="dialog" aria-modal="true" aria-label="本編「<?php echo esc_attr( get_the_title( $work ) ); ?>」の再生" aria-hidden="true">
  <div class="modal-bg"></div>
  <div class="modal-frame is-embed-modal">
    <button type="button" class="modal-btn modal-close" id="close-film-modal" aria-label="閉じる">&times;</button>
    <div class="modal-stage">
      <iframe id="film-embed" class="modal-embed" title="ショートフィルム「<?php echo esc_attr( get_the_title( $work ) ); ?>」(Instagram)" data-src="<?php echo esc_url( get_field( 'film_embed', $work ) ); ?>" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
  </div>
</div>

<div id="video-modal" class="modal" role="dialog" aria-modal="true" aria-label="動画の拡大表示" aria-hidden="true">
  <div class="modal-bg"></div>
  <div class="modal-frame">
    <button type="button" class="modal-btn modal-close" id="close-video-modal" aria-label="閉じる">&times;</button>
    <button type="button" class="modal-btn modal-arrow modal-arrow-prev" id="video-modal-prev" aria-label="前の動画">‹</button>
    <div class="modal-stage">
      <video id="modal-video-player" class="modal-media" <?php if ( get_field( 'film_video', $work ) ) : ?>src="<?php fp_video( get_field( 'film_video', $work ) ); ?>" <?php endif; ?>controls playsinline preload="metadata"></video>
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
