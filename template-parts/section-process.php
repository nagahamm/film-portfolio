<?php
/**
 * Process — 制作プロセスの時期と、時期ごとのエピソード(撮影回など)。
 * エピソードのメディアは、1枚の写真ならそのまま、1本の動画なら1枚のスライド、
 * 2件以上ならカルーセルにする。
 */

$section = fp_section( 'process' );
if ( ! $section ) {
	return;
}
?>
<section class="timeline-section" id="process">
  <div class="wrap">
    <div class="eyebrow fade">Process</div>
    <h2 class="fade">制作プロセス</h2>

<?php foreach ( $section['periods'] ?: [] as $period ) : ?>
    <div class="tl-item fade">
      <div class="tl-time"><?php echo esc_html( $period['time'] ); ?></div>
      <div><h3><?php echo esc_html( $period['title'] ); ?></h3>
      <p><?php fp_text( $period['intro'] ); ?></p>
<?php if ( $period['episodes'] ) : ?>
      <div class="ep-list">
<?php foreach ( $period['episodes'] as $episode ) :
	$media = $episode['media'] ?: [];
	$noun  = array_filter( $media, fn( $m ) => ! wp_attachment_is( 'video', $m['file'] ) ) ? '写真' : '動画';
	$cmp   = $episode['compare'];
	?>
        <div class="ep-item">
          <h4 class="ep-title"><?php echo esc_html( $episode['title'] ); ?></h4>
<?php if ( count( $media ) > 1 ) : ?>
          <div class="ep-media">
            <div class="carousel-track" data-carousel>
<?php foreach ( $media as $item ) : ?>
              <div class="carousel-slide">
<?php get_template_part( 'template-parts/part-media', null, [ 'item' => $item ] ); ?>
              </div>
<?php endforeach; ?>
            </div>
            <button class="carousel-arrow carousel-arrow-prev" aria-label="前の<?php echo $noun; ?>" type="button">‹</button>
            <button class="carousel-arrow carousel-arrow-next" aria-label="次の<?php echo $noun; ?>" type="button">›</button>
            <div class="carousel-dots"></div>
          </div>
<?php elseif ( $media && wp_attachment_is( 'video', $media[0]['file'] ) ) : ?>
          <div class="ep-media">
            <div class="carousel-slide">
<?php get_template_part( 'template-parts/part-media', null, [ 'item' => $media[0] ] ); ?>
            </div>
          </div>
<?php elseif ( $media ) : ?>
          <div class="ep-media">
<?php get_template_part( 'template-parts/part-media', null, [ 'item' => $media[0] ] ); ?>
          </div>
<?php endif; ?>
<?php if ( $cmp && $cmp['enabled'] ) : ?>
          <div class="compare-slider" data-compare>
            <div class="compare-after">
              <img src="<?php echo esc_url( wp_get_attachment_url( $cmp['after_image'] ) ); ?>" alt="<?php fp_alt( $cmp['after_image'] ); ?>" loading="lazy" decoding="async">
              <span class="compare-label compare-label-after"><?php echo esc_html( $cmp['after_label'] ); ?></span>
            </div>
            <div class="compare-before">
              <img src="<?php echo esc_url( wp_get_attachment_url( $cmp['before_image'] ) ); ?>" alt="<?php fp_alt( $cmp['before_image'] ); ?>" loading="lazy" decoding="async">
              <span class="compare-label compare-label-before"><?php echo esc_html( $cmp['before_label'] ); ?></span>
            </div>
            <div class="compare-divider"></div>
            <div class="compare-handle" aria-hidden="true"></div>
            <input type="range" class="compare-range" min="0" max="100" value="50" aria-label="<?php echo esc_attr( $cmp['description'] ); ?>">
          </div>
          <p class="compare-caption"><?php fp_text( $cmp['caption'] ); ?></p>
<?php endif; ?>
          <p class="ep-body"><?php fp_text( $episode['body'] ); ?></p>
        </div>
<?php endforeach; ?>
      </div>
<?php endif; ?>
      </div>
    </div>

<?php endforeach; ?>
  </div>
</section>
