<?php
/**
 * Materials — 制作資料のカード。PDF の実体はカードが唯一の定義元。
 */

$section = fp_section( 'materials' );
if ( ! $section ) {
	return;
}
?>
<section class="materials-section" id="materials">
  <div class="wrap fade">
    <div class="eyebrow">Materials</div>
    <h2>制作資料</h2>
    <p class="lead"><?php fp_text( $section['lead'] ); ?></p>
    <div class="materials-grid">
<?php foreach ( $section['cards'] as $card ) : ?>
      <a class="material-card"<?php if ( $card['anchor'] ) : ?> id="<?php echo esc_attr( $card['anchor'] ); ?>"<?php endif; ?> href="<?php echo esc_url( $card['file'] ); ?>" target="_blank" rel="noopener">
        <span class="mat-icon">PDF</span>
        <span>
          <span class="mat-label"><?php echo esc_html( $card['label'] ); ?></span>
          <span class="mat-sub"><?php echo esc_html( $card['label_en'] ); ?></span>
        </span>
      </a>
<?php endforeach; ?>
    </div>
  </div>
</section>
