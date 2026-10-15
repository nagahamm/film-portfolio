<?php
/**
 * 作品のセクション(入力欄 sections、Flexible Content)を読み出す。
 */

/** 表示中の作品から、指定したレイアウトのセクションを1つ返す。置かれていなければ null */
function fp_section( string $layout ): ?array {
	foreach ( (array) get_field( 'sections', get_queried_object_id() ) as $row ) {
		if ( ( $row['acf_fc_layout'] ?? '' ) === $layout ) {
			return $row;
		}
	}
	return null;
}

/**
 * 入力された文を出力する。HTML は無効にし、改行を <br> に、特定語をリンクにする。
 * $mark_external は fp_autolink() を参照。
 */
function fp_text( string $text, bool $mark_external = false ): void {
	echo fp_autolink( nl2br( esc_html( $text ), false ), $mark_external );
}

/** 1行を1項目として返す(箇条書きの入力欄用) */
function fp_lines( string $text ): array {
	return array_values( array_filter( array_map( 'trim', explode( "\n", $text ) ), 'strlen' ) );
}
