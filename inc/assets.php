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

/**
 * 表示中の作品の動画の URL を出力する。実体は R2 の videos/<作品の slug>/ にあり、
 * /assets/videos/* は本番では netlify.toml、Local では nginx の設定が R2 へ振り向ける。
 */
function fp_video( string $file ): void {
	echo esc_url( '/assets/videos/' . get_post_field( 'post_name', get_queried_object_id() ) . '/' . $file );
}

/** テーマ内 assets/ 配下のファイルの URL を出力する */
function fp_asset( string $path ): void {
	echo esc_url( get_theme_file_uri( 'assets/' . $path ) );
}
