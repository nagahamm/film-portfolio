<?php
/**
 * Next — 今回の課題と次回の改善点(課題・改善策の表)。
 */

$section = fp_section( 'next' );
if ( ! $section ) {
	return;
}
?>
<section class="next-section" id="next">
  <div class="wrap">
    <div class="eyebrow fade eyebrow-sand">NEXT</div>
    <h2 class="fade">今回の課題と次回の改善点</h2>

<?php get_template_part( 'template-parts/part-par-table', null, [
	'columns' => [ 'Problem (今回の課題・反省)', 'Next Action (次回の改善策)' ],
	'fields'  => [ 'problem', 'action' ],
	'rows'    => $section['rows'],
	'duo'     => true,
] ); ?>
  </div>
</section>
