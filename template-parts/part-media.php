<?php
/**
 * 撮影回のメディア1件(写真または動画)とキャプション。
 *   $args['item'] 入力欄の1件(type・image・alt・video・poster・audio・caption)
 */

$item = $args['item'];
if ( 'video' === $item['type'] ) : ?>
<video src="<?php fp_video( $item['video'] ); ?>" poster="<?php echo esc_url( $item['poster'] ); ?>" autoplay muted loop playsinline preload="metadata"></video>
<?php if ( $item['audio'] ) get_template_part( 'template-parts/part-mute-button' ); ?>
<?php else : ?>
<img src="<?php echo esc_url( $item['image'] ); ?>" alt="<?php echo esc_attr( $item['alt'] ); ?>" loading="lazy" decoding="async">
<?php endif; ?>
<p class="ep-caption"><?php fp_text( $item['caption'] ); ?></p>
