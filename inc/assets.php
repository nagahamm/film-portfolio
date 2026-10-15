<?php
/**
 * CSS・JS の読み込みと、テーマ内アセットの URL。
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

/** テーマ内 assets/ 配下のファイルの URL を出力する */
function fp_asset( string $path ): void {
	echo esc_url( get_theme_file_uri( 'assets/' . $path ) );
}
