<?php
/**
 * 投稿タイプ「作品」。作品1件 = 投稿1件、URL は /works/<slug>/。
 * 本文は入力欄(sections)が持つため、エディタは使わない。
 */

add_action( 'init', function () {
	register_post_type( 'work', [
		'labels'       => [
			'name'          => '作品',
			'singular_name' => '作品',
			'add_new_item'  => '作品を追加',
			'edit_item'     => '作品を編集',
		],
		'public'       => true,
		'has_archive'  => false,
		'rewrite'      => [ 'slug' => 'works' ],
		'menu_icon'    => 'dashicons-video-alt2',
		'supports'     => [ 'title', 'excerpt', 'thumbnail', 'page-attributes' ],
		'show_in_rest' => false,
	] );
} );

// 投稿タイプの URL を有効にする
add_action( 'after_switch_theme', 'flush_rewrite_rules' );
