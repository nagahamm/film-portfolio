<?php
/**
 * 本文中の特定語のリンク化(CLAUDE.md「本文中の特定語の自動リンク化」)。
 * リンクは入力させず、出力時にここで付ける。辞書は次の3つを合わせたもの。
 *   - サイト共通: Instagram
 *   - 作品のロケ地: ロケ地名 → Google Maps
 *   - 作品の資料カード: カードの「リンク語」 → そのカードのアンカー
 */

const FP_INSTAGRAM_URL = 'https://www.instagram.com/nagahamm_film';

/** 表示中の作品のリンク辞書(語 => URL)。長い語から順に並べ、部分一致での取り違えを防ぐ */
function fp_link_dictionary(): array {
	static $dict = null;
	if ( null !== $dict ) {
		return $dict;
	}

	$dict = [ 'Instagram' => FP_INSTAGRAM_URL ];
	foreach ( (array) get_field( 'locations', get_queried_object_id() ) as $location ) {
		$dict[ $location['name'] ] = $location['url'];
	}
	foreach ( fp_section( 'materials' )['cards'] ?? [] as $card ) {
		if ( ! $card['anchor'] ) {
			continue;
		}
		foreach ( array_filter( array_map( 'trim', explode( ',', (string) $card['link_words'] ) ) ) as $word ) {
			$dict[ $word ] = '#' . $card['anchor'];
		}
	}

	uksort( $dict, fn( $a, $b ) => mb_strlen( $b ) <=> mb_strlen( $a ) );
	return $dict;
}

/**
 * エスケープ済みの HTML に含まれる辞書の語をリンクにする。
 * ページ内アンカーには常に .inline-link を付ける。外部リンクに付けるかはセクションが決める
 * (リンク色をセクション側で持たない暗背景のセクションだけ付ける)。
 */
function fp_autolink( string $html, bool $mark_external = false ): string {
	$dict = fp_link_dictionary();
	$pattern = '/' . implode( '|', array_map( fn( $w ) => preg_quote( esc_html( $w ), '/' ), array_keys( $dict ) ) ) . '/u';

	return preg_replace_callback( $pattern, function ( array $m ) use ( $dict, $mark_external ): string {
		$url = $dict[ html_entity_decode( $m[0] ) ];
		if ( str_starts_with( $url, '#' ) ) {
			return sprintf( '<a href="%s" class="inline-link">%s</a>', esc_attr( $url ), $m[0] );
		}
		return sprintf(
			'<a href="%s" target="_blank" rel="noopener"%s>%s</a>',
			esc_url( $url ),
			$mark_external ? ' class="inline-link"' : '',
			$m[0]
		);
	}, $html );
}
