<?php
/**
 * Craft — 担当領域のカード。写真が無ければ文字だけ、1枚なら写真、
 * 複数枚または「スライド表示」ならカルーセルにする。
 */

$section = fp_section( 'craft' );
if ( ! $section ) {
	return;
}
?>
<section class="craft-section" id="craft">
  <div class="wrap">
    <div class="eyebrow fade">ROLES & CRAFT</div>
    <h2 class="fade">担当領域</h2>
    <div class="masonry-grid">
      <div class="masonry-sizer"></div>
<?php foreach ( $section['cards'] ?: [] as $card ) :
	$photos   = $card['photos'] ?: [];
	$carousel = count( $photos ) > 1 || ( $photos && $card['carousel'] );
	?>
      <div class="craft-card masonry-item<?php echo $photos ? ' has-photo' : ''; ?>"<?php if ( $card['label'] ) : ?> data-label="<?php echo esc_attr( $card['label'] ); ?>"<?php endif; ?> data-has-border="true">
<?php if ( $carousel ) : ?>
        <div class="carousel-track" data-carousel>
<?php foreach ( $photos as $photo ) : ?>
          <div class="carousel-slide"><img src="<?php echo esc_url( $photo['image'] ); ?>" alt="<?php echo esc_attr( $photo['alt'] ); ?>" loading="lazy" decoding="async"></div>
<?php endforeach; ?>
        </div>
        <button class="carousel-arrow carousel-arrow-prev" aria-label="前の写真" type="button">‹</button>
        <button class="carousel-arrow carousel-arrow-next" aria-label="次の写真" type="button">›</button>
        <div class="carousel-dots"></div>
<?php elseif ( $photos ) : ?>
        <img src="<?php echo esc_url( $photos[0]['image'] ); ?>" alt="<?php echo esc_attr( $photos[0]['alt'] ); ?>" loading="lazy" decoding="async">
<?php endif; ?>
        <div class="craft-overlay"><div class="eyebrow"><?php echo esc_html( $card['title'] ); ?></div><p><?php fp_craft_text( $card ); ?></p></div>
      </div>
<?php endforeach; ?>
    </div>
  </div>
</section>
