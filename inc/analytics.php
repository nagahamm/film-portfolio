<?php
/**
 * Google アナリティクス4(gtag.js)。測定 ID はここだけに置く。
 * 書き出した静的 HTML にだけ入れ、手元(Local)の開発表示では計測しない。
 * 判定は書き出し(scripts/export-site.mjs)がページ取得時に付ける
 * ?fp_export=1 の有無で行う。素のアクセス(編集中の確認)には出ない。
 */

/** GA4 の測定 ID(定義元。他では literal で書かない) */
const FP_GA4_ID = 'G-BJYVB7PD70';

add_action( 'wp_head', function () {
	if ( ! isset( $_GET['fp_export'] ) ) {
		return;
	}
	?>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=<?php echo rawurlencode( FP_GA4_ID ); ?>"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', '<?php echo esc_js( FP_GA4_ID ); ?>');
</script>
<?php
} );
