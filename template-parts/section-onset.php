<?php
/**
 * Approach — 過去の反省と事前の工夫(課題・対策・成果の表)。
 */

$section = fp_section( 'onset' );
if ( ! $section ) {
	return;
}
?>
<section class="onset-section" id="onset">
  <div class="wrap">
    <div class="eyebrow fade eyebrow-sand">PRE-PRODUCTION</div>
    <h2 class="fade">過去の反省と事前の工夫</h2>

<?php get_template_part( 'template-parts/part-par-table', null, [
	'columns' => [ 'Problem (課題)', 'Action (対策)', 'Result (成果)' ],
	'fields'  => [ 'problem', 'action', 'result' ],
	'rows'    => $section['rows'],
	'duo'     => false,
] ); ?>
  </div>
</section>
