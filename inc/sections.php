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

/** 入力された文を出力する。HTML は無効にし、改行だけを <br> にする */
function fp_text( string $text ): void {
	echo nl2br( esc_html( $text ), false );
}
