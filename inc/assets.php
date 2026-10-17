<?php
/**
 * CSS・JS の読み込みと、作品の動画・動画のポスター・本編の埋め込みの URL。
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

/**
 * 動画(添付ファイル ID)のポスターの URL を出力する。ポスターは動画と同じベース名に
 * -poster を付けた jpg として同じ作品のフォルダに上げる決まりなので、名前から作る。
 * 上げ忘れは書き出しの段階で参照先が見つからずに止まる。
 */
function fp_poster( int $id ): void {
	echo esc_url( preg_replace( '/\.[^.\/]+$/', '-poster.jpg', wp_get_attachment_url( $id ) ) );
}

/**
 * 本編の埋め込み URL。本編の URL(/reel/<ID>/・/reels/<ID>/・/p/<ID>/)の ID から作る。
 * 読み取れない URL なら空文字。
 */
function fp_film_embed( int $work ): string {
	if ( ! preg_match( '#instagram\.com/(?:reels?|p)/([\w-]+)#', (string) get_field( 'film_url', $work ), $m ) ) {
		return '';
	}
	return 'https://www.instagram.com/reel/' . $m[1] . '/embed/';
}
