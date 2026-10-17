<?php
/**
 * 撮影回のメディア1件(写真または動画)とキャプション。
 *   $args['item'] 入力欄の1件(file・alt・caption)。写真か動画かはファイルで決まる。
 *   alt はこの場所だけの写真の説明で、空ならメディアライブラリの説明を使う
 */

$item = $args['item'];
if ( wp_attachment_is( 'video', $item['file'] ) ) : ?>
<video src="<?php fp_video( $item['file'] ); ?>" poster="<?php fp_poster( $item['file'] ); ?>" autoplay muted loop playsinline preload="metadata"></video>
<?php if ( fp_has_audio( $item['file'] ) ) get_template_part( 'template-parts/part-mute-button' ); ?>
<?php else : ?>
<img src="<?php echo esc_url( wp_get_attachment_url( $item['file'] ) ); ?>" alt="<?php fp_alt( $item['file'], $item['alt'] ); ?>" loading="lazy" decoding="async">
<?php endif; ?>
<p class="ep-caption"><?php fp_text( $item['caption'] ); ?></p>
