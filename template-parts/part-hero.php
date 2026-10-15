<?php
/**
 * 作品ページのヒーロー。作品の基本項目から作る。
 */

$work = get_queried_object_id();
?>
<section class="hero">
  <svg class="hero-land" viewBox="0 0 1200 400" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0,260 L120,210 L260,255 L400,180 L560,240 L720,150 L880,230 L1040,190 L1200,250 L1200,400 L0,400 Z" fill="#221a10"/>
    <path d="M0,320 L180,290 L360,330 L520,280 L700,325 L900,300 L1080,335 L1200,310 L1200,400 L0,400 Z" fill="#171208"/>
  </svg>
  <div class="wrap">
    <div class="eyebrow"><?php echo esc_html( get_field( 'hero_eyebrow', $work ) ); ?></div>
    <h1>
      <?php echo esc_html( get_the_title( $work ) ); ?>

      <span class="genre"><?php echo esc_html( get_field( 'hero_genre', $work ) ); ?></span>
    </h1>
    <p class="hero-sub"><?php fp_text( get_field( 'hero_lead', $work ) ); ?></p>
  </div>
</section>
