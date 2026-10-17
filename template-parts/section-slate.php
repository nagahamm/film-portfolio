<?php
/**
 * Slate — 作品概要のカード。値が2行以上のカードは1行を1項目の箇条書きにする。
 * 先頭の Title・Runtime は作品名と本編の尺から作る(入力させない)。
 */

$section = fp_section( 'slate' );
if ( ! $section ) {
	return;
}
$work  = get_queried_object_id();
$cards = array_merge( [
	[ 'label' => 'Title', 'value' => get_the_title( $work ) ],
	[ 'label' => 'Runtime', 'value' => get_field( 'runtime', $work ) ],
], $section['cards'] ?: [] );
?>
<section class="slate-section" id="slate">
  <div class="wrap">
    <div class="eyebrow fade eyebrow-sand">PROD. SLATE</div>
    <h2 class="fade">作品概要</h2>
    <div class="slate fade">
      <div class="slate-grid masonry-grid">
        <div class="masonry-sizer"></div>
<?php foreach ( $cards as $card ) :
	$lines = fp_lines( $card['value'] );
	?>
        <div class="slate-card masonry-item">
          <dl class="slate-item"><dt><?php echo esc_html( $card['label'] ); ?></dt><dd>
<?php if ( count( $lines ) > 1 ) : ?>
            <ul class="slate-list">
<?php foreach ( $lines as $line ) : ?>
              <li><?php fp_text( $line ); ?></li>
<?php endforeach; ?>
            </ul>
<?php else : ?>
            <?php fp_text( $card['value'] ); ?>

<?php endif; ?>
          </dd></dl>
        </div>
<?php endforeach; ?>
      </div>
    </div>
  </div>
</section>
