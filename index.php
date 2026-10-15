<?php
/**
 * WordPress がテーマに必須とする最後の受け皿。
 * このサイトは作品一覧・作品ページ・案内ページ以外を持たないため、ここに来たものは 404 として扱う。
 */

global $wp_query;
$wp_query->set_404();
status_header( 404 );
get_template_part( '404' );
