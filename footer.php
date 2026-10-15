<?php
/**
 * 共通の足。「作品を観る」は fp_footer_work() の作品の本編へ。
 */
?>
<footer class="footer">
  <div class="wrap">
    <div class="eyebrow">CONTACT</div>
    <h2>お問い合わせ</h2>
    <div class="cta-row">
      <a class="btn btn-primary" href="<?php echo esc_url( get_field( 'film_url', fp_footer_work() ) ); ?>" target="_blank" rel="noopener">▶ 作品を観る</a>
      <a class="btn btn-ghost" href="mailto:nagahamg@gmail.com">nagahamg@gmail.com</a>
    </div>
    <div class="meta">
      <span>光輝 — Short Film Portfolio</span>
    </div>
  </div>
</footer>

<?php if ( is_singular( 'work' ) ) get_template_part( 'template-parts/part-modals' ); ?>

<?php wp_footer(); ?>

</body>
</html>
