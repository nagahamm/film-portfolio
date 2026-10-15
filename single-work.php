<?php
/**
 * 作品ページ。ヒーローのあと、表示するセクションを決まった順で描く(inc/sections.php)。
 */

get_header( null, [
	'title'       => get_field( 'page_title' ) ?: get_the_title() . ' — SHORT FILM PORTFOLIO 光輝',
	'description' => get_the_excerpt(),
	'nav'         => fp_section_nav(),
] );
get_template_part( 'template-parts/part-hero' );

foreach ( fp_sections() as $name ) {
	get_template_part( 'template-parts/section-' . $name );
}

get_footer();
