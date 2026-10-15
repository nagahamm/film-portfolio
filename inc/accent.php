<?php
/**
 * 作品ごとの差し色(docs/design.md「差し色」)。
 * 色の値は入力させず、css/style.css の .accent-<名前> を選ぶだけにする。
 * 色を足すときは CSS に .accent-<名前> を足し、ここに名前を足す。
 */

/** 選択肢(名前 => 管理画面の表示名)。先頭が既定で、既定はクラスを付けない */
const FP_ACCENTS = [
	'rust' => 'ラスト(既定)',
];

// 入力欄「差し色」の選択肢を上の定義から作る
add_filter( 'acf/load_field/key=field_work_accent', function ( array $field ): array {
	$field['choices']       = FP_ACCENTS;
	$field['default_value'] = array_key_first( FP_ACCENTS );
	return $field;
} );

/** 表示中の作品の差し色クラス。既定・作品ページ以外は空文字 */
function fp_accent_class(): string {
	$accent = is_singular( 'work' ) ? (string) get_field( 'accent', get_queried_object_id() ) : '';
	return ( isset( FP_ACCENTS[ $accent ] ) && array_key_first( FP_ACCENTS ) !== $accent ) ? 'accent-' . $accent : '';
}
