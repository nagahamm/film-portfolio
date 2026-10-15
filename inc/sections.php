<?php
/**
 * 作品のセクションを読み出す。入力欄はセクションごとのタブ(グループ)で、
 * 並び順は FP_SECTIONS で固定。「このセクションを表示する」がオフのものは出さない。
 */

/** セクション(入力欄のグループ名 = template-parts/section-<名前>.php)。ページに出る順 */
const FP_SECTIONS = [ 'watch', 'slate', 'craft', 'onset', 'process', 'materials', 'next' ];

/** ヘッダーのナビに出すセクション(名前 => 表示名)。Next はナビに出さない */
const FP_SECTION_NAV = [
	'watch'     => 'Watch',
	'slate'     => 'Slate',
	'craft'     => 'Craft',
	'onset'     => 'Approach',
	'process'   => 'Process',
	'materials' => 'Materials',
];

/** 表示中の作品から、指定したセクションの入力値を返す。表示しないセクションなら null */
function fp_section( string $name ): ?array {
	$section = get_field( $name, get_queried_object_id() );
	return ( is_array( $section ) && ! empty( $section['enabled'] ) ) ? $section : null;
}

/** 表示中の作品で表示するセクションの名前を、ページに出る順で返す */
function fp_sections(): array {
	return array_values( array_filter( FP_SECTIONS, fn( $name ) => fp_section( $name ) ) );
}

/** 作品ページのヘッダーのナビ([リンク先, 表示名] の並び)。表示するセクションだけをページの順に */
function fp_section_nav(): array {
	$nav = [];
	foreach ( fp_sections() as $name ) {
		if ( isset( FP_SECTION_NAV[ $name ] ) ) {
			$nav[] = [ '#' . $name, FP_SECTION_NAV[ $name ] ];
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
