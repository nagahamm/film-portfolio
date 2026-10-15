<?php
/**
 * 作品ページ。ヒーローのあと、セクションを上から順に描く。
 */

get_header();
get_template_part( 'template-parts/part-hero' );

foreach ( [ 'watch', 'slate', 'craft', 'onset', 'process', 'materials', 'next' ] as $section ) {
	get_template_part( 'template-parts/section-' . $section );
}

get_footer();
