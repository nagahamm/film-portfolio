<?php
/**
 * 撮影回のメディア1件(写真または動画)とキャプション。
 *   $args['item'] 入力欄の1件(file・alt・poster・audio・caption)。写真か動画かはファイルで決まる
 */

$item = $args['item'];
if ( wp_attachment_is( 'video', $item['file'] ) ) : ?>
<video src="<?php fp_video( $item['file'] ); ?>" poster="<?php echo esc_url( $item['poster'] ); ?>" autoplay muted loop playsinline preload="metadata"></video>
<?php if ( $item['audio'] ) get_template_part( 'template-parts/part-mute-button' ); ?>
<?php else : ?>
<img src="<?php echo esc_url( wp_get_attachment_url( $item['file'] ) ); ?>" alt="<?php echo esc_attr( $item['alt'] ); ?>" loading="lazy" decoding="async">
<?php endif; ?>
<p class="ep-caption"><?php fp_text( $item['caption'] ); ?></p>
