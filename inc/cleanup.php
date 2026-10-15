<?php
/**
 * WordPress が自動で足す出力を止める。
 * 書き出した HTML を移行前の index.html と同じ形に保つため(docs/design.md「責務の分離」)。
 */

// <head> に足されるメタ情報・リンク
remove_action( 'wp_head', 'wp_generator' );
remove_action( 'wp_head', 'rsd_link' );
remove_action( 'wp_head', 'wlwmanifest_link' );
remove_action( 'wp_head', 'wp_shortlink_wp_head' );
remove_action( 'wp_head', 'rest_output_link_wp_head' );
remove_action( 'wp_head', 'wp_oembed_add_discovery_links' );
remove_action( 'wp_head', 'feed_links', 2 );
remove_action( 'wp_head', 'feed_links_extra', 3 );
remove_action( 'wp_head', 'rel_canonical' );
remove_action( 'wp_head', 'adjacent_posts_rel_link_wp_head' );
remove_action( 'wp_head', 'wp_resource_hints', 2 );
remove_filter( 'wp_robots', 'wp_robots_max_image_preview_large' );
remove_action( 'template_redirect', 'rest_output_link_header', 11 );
remove_action( 'template_redirect', 'wp_shortlink_header', 11 );

// 絵文字の置き換え
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'wp_print_styles', 'print_emoji_styles' );

// ブロックエディタ用の CSS とスクリプト(このテーマはブロックを使わない)
add_action( 'wp_enqueue_scripts', function () {
	wp_dequeue_style( 'wp-block-library' );
	wp_dequeue_style( 'global-styles' );
	wp_dequeue_style( 'classic-theme-styles' );
}, 100 );
remove_action( 'wp_enqueue_scripts', 'wp_enqueue_global_styles' );
remove_action( 'wp_footer', 'wp_enqueue_global_styles', 1 );
remove_action( 'wp_body_open', 'wp_global_styles_render_svg_filters' );
add_filter( 'should_load_separate_core_block_assets', '__return_false' );
add_filter( 'wp_img_tag_add_auto_sizes', '__return_false' );

// ページ遷移の先読み
add_filter( 'wp_speculation_rules_configuration', '__return_null' );

// 記号の自動置き換え(— … 「」を入力どおりに出す)
add_filter( 'run_wptexturize', '__return_false' );
