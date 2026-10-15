<?php
/**
 * 作品ページ。ヒーローのあと、セクションを上から順に描く。
 */

get_header( null, [
	'title'       => 'SHORT FILM PORTFOLIO — 光輝',
	'description' => 'ショートフィルム「エル・ドラド」制作ポートフォリオ。オーストラリアで撮影した冒険ファンタジー(03:05)の脚本・監督・主演・撮影・編集までの制作プロセスと制作資料。',
] );
get_template_part( 'template-parts/part-hero' );

foreach ( [ 'watch', 'slate', 'craft', 'onset', 'process', 'materials', 'next' ] as $section ) {
	get_template_part( 'template-parts/section-' . $section );
}

get_footer();
