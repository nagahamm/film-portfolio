<?php
/**
 * CSS・JS の読み込みと、作品の動画の URL。
 * バージョン引数にファイルの更新時刻を渡し、変更時にキャッシュを破棄する。
 */

add_action( 'wp_enqueue_scripts', function () {
	$ver = fn( $path ) => (string) filemtime( get_theme_file_path( $path ) );

	wp_enqueue_style( 'film-portfolio', get_theme_file_uri( 'css/style.css' ), [], $ver( 'css/style.css' ) );

	if ( ! is_singular( 'work' ) ) {
		return;
	}
	wp_enqueue_script( 'fp-imagesloaded', 'https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js', [], null, [ 'strategy' => 'defer' ] );
	wp_enqueue_script( 'fp-masonry', 'https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js', [], null, [ 'strategy' => 'defer' ] );
	wp_enqueue_script( 'film-portfolio', get_theme_file_uri( 'js/main.js' ), [], $ver( 'js/main.js' ), [ 'in_footer' => true ] );
} );

/**
 * 動画(メディアライブラリの添付ファイル ID)の URL を出力する。メディアライブラリ上の
 * 置き場所 <作品の slug>/<ファイル名> をそのまま /assets/videos/ の下に付ける。
 * 本番では netlify.toml が R2 の videos/ へ、Local では nginx の設定が uploads/ へ振り向ける。
 */
function fp_video( int $id ): void {
	echo esc_url( '/assets/videos/' . get_post_meta( $id, '_wp_attached_file', true ) );
}
