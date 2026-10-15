<?php
/**
 * 作品ページ。ヒーローのあと、入力欄に置いたセクションをその並び順で描く。
 */

get_header( null, [
	'title'       => get_field( 'page_title' ) ?: get_the_title() . ' — SHORT FILM PORTFOLIO 光輝',
	'description' => get_the_excerpt(),
	'nav'         => fp_section_nav(),
] );
get_template_part( 'template-parts/part-hero' );

foreach ( fp_sections() as $section ) {
	get_template_part( 'template-parts/section-' . $section['acf_fc_layout'] );
}

get_footer();
