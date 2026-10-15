<?php
/**
 * 作品のセクション(入力欄 sections、Flexible Content)を読み出す。
 */

/** ヘッダーのナビに出すセクション(レイアウト => 表示名)。Next はナビに出さない */
const FP_SECTION_NAV = [
	'watch'     => 'Watch',
	'slate'     => 'Slate',
	'craft'     => 'Craft',
	'onset'     => 'Approach',
	'process'   => 'Process',
	'materials' => 'Materials',
];

/** 表示中の作品のセクションを、入力欄の並び順で返す */
function fp_sections(): array {
	return array_values( array_filter( (array) get_field( 'sections', get_queried_object_id() ) ) );
}

/** 表示中の作品から、指定したレイアウトのセクションを1つ返す。置かれていなければ null */
function fp_section( string $layout ): ?array {
	foreach ( fp_sections() as $row ) {
		if ( ( $row['acf_fc_layout'] ?? '' ) === $layout ) {
			return $row;
		}
	}
	return null;
}

/**
 * ヘッダーのナビ([リンク先, 表示名] の並び)。
 * 作品ページでは置いたセクションだけを並び順どおりに、それ以外では全セクションを $base 付きで返す。
 */
function fp_section_nav( string $base = '' ): array {
	$layouts = is_singular( 'work' ) ? array_column( fp_sections(), 'acf_fc_layout' ) : array_keys( FP_SECTION_NAV );
	$nav     = [];
	foreach ( $layouts as $layout ) {
		if ( isset( FP_SECTION_NAV[ $layout ] ) ) {
			$nav[] = [ $base . '#' . $layout, FP_SECTION_NAV[ $layout ] ];
		}
	}
	return $nav;
}

/** フッターの「作品を観る」の作品。作品ページではその作品、それ以外では一覧の先頭の作品 */
function fp_footer_work(): int {
	if ( is_singular( 'work' ) ) {
		return get_queried_object_id();
	}
	$latest = get_posts( [ 'post_type' => 'work', 'numberposts' => 1, 'orderby' => [ 'menu_order' => 'ASC', 'date' => 'DESC' ], 'fields' => 'ids' ] );
	return $latest[0] ?? 0;
}

/**
 * 入力された文を出力する。HTML は無効にし、改行を <br> に、特定語をリンクにする。
 * $mark_external は fp_autolink() を参照。
 */
function fp_text( ?string $text, bool $mark_external = false ): void {
	echo fp_autolink( nl2br( esc_html( (string) $text ), false ), $mark_external );
}

/** 1行を1項目として返す(箇条書きの入力欄用) */
function fp_lines( ?string $text ): array {
	return array_values( array_filter( array_map( 'trim', explode( "\n", (string) $text ) ), 'strlen' ) );
}

/** Craft のカードの説明。「強調する語」があれば最初の1か所を .craft-hero-spec で囲む */
function fp_craft_text( array $card ): void {
	ob_start();
	fp_text( $card['text'], true );
	$html = ob_get_clean();

	$word = esc_html( $card['highlight'] ?? '' );
	if ( '' !== $word && false !== ( $at = strpos( $html, $word ) ) ) {
		$html = substr_replace( $html, '<span class="craft-hero-spec">' . $word . '</span>', $at, strlen( $word ) );
	}
	echo $html;
}
