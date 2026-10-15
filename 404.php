<?php
/**
 * 案内ページ(存在しない URL)。
 */

get_header( null, [
	'title'    => 'ページが見つかりません — SHORT FILM PORTFOLIO 光輝',
	'robots'   => 'noindex',
] );
?>

<main class="hero notfound">
<?php get_template_part( 'template-parts/part-hero-land' ); ?>
  <div class="wrap">
    <div class="eyebrow">Error 404 — Page Not Found</div>
    <h1>
      <span class="notfound-code">404</span>
      ページが見つかりません
      <span class="genre">お探しのページは削除、または移動した可能性があります</span>
    </h1>
    <p class="hero-sub">URLに誤りがないかご確認ください。作品一覧から各作品へ移動できます。</p>
    <div class="cta-row">
      <a class="btn btn-primary" href="/">← 作品一覧に戻る</a>
      <a class="btn btn-ghost" href="<?php echo esc_url( get_permalink( fp_footer_work() ) ); ?>">作品を観る</a>
    </div>
  </div>
</main>

<?php get_footer(); ?>
