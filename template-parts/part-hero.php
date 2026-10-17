<?php
/**
 * 作品ページのヒーロー。作品の基本項目から作る。
 * 作品名の下の行は「ジャンル / 尺」。尺は本編の尺を使う。
 */

$work = get_queried_object_id();
?>
<section class="hero">
<?php get_template_part( 'template-parts/part-hero-land' ); ?>
  <div class="wrap">
    <div class="eyebrow"><?php echo esc_html( get_field( 'hero_eyebrow', $work ) ); ?></div>
    <h1>
      <?php echo esc_html( get_the_title( $work ) ); ?>

      <span class="genre"><?php echo esc_html( implode( ' / ', array_filter( [ get_field( 'hero_genre', $work ), get_field( 'runtime', $work ) ] ) ) ); ?></span>
    </h1>
    <p class="hero-sub"><?php fp_text( get_field( 'hero_lead', $work ) ); ?></p>
  </div>
</section>
