<?php
/**
 * メディアライブラリの置き場所と生成物(docs/design.md「メディアの配信」)。
 * 原本のファイル名のまま、作品ごとのフォルダに1枚だけ置く。
 */

// 作品に添付するファイルは uploads/<作品の slug>/ へ。それ以外は uploads/ 直下
add_filter( 'upload_dir', function ( array $dirs ): array {
	$post = get_post( absint( $_REQUEST['post_id'] ?? 0 ) );
	$sub  = ( $post && 'work' === $post->post_type ) ? '/' . $post->post_name : '';

	$dirs['subdir'] = $sub;
	$dirs['path']   = $dirs['basedir'] . $sub;
	$dirs['url']    = $dirs['baseurl'] . $sub;
	return $dirs;
} );

// 別サイズの画像・PDF のサムネイル・大きな画像の縮小版を作らない
add_filter( 'intermediate_image_sizes_advanced', '__return_empty_array' );
add_filter( 'fallback_intermediate_image_sizes', '__return_empty_array' );
add_filter( 'big_image_size_threshold', '__return_false' );
