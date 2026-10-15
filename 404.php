<?php
/**
 * 案内ページ(存在しない URL)。
 */

get_header( null, [
	'title'    => 'ページが見つかりません — SHORT FILM PORTFOLIO 光輝',
	'robots'   => 'noindex',
	'nav_base' => '/',
] );
?>

<main class="hero notfound">
  <svg class="hero-land" viewBox="0 0 1200 400" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0,260 L120,210 L260,255 L400,180 L560,240 L720,150 L880,230 L1040,190 L1200,250 L1200,400 L0,400 Z" fill="#221a10"/>
    <path d="M0,320 L180,290 L360,330 L520,280 L700,325 L900,300 L1080,335 L1200,310 L1200,400 L0,400 Z" fill="#171208"/>
  </svg>
  <div class="wrap">
    <div class="eyebrow">Error 404 — Page Not Found</div>
    <h1>
      <span class="notfound-code">404</span>
      ページが見つかりません
      <span class="genre">お探しのページは削除、または移動した可能性があります</span>
    </h1>
    <p class="hero-sub">URLに誤りがないかご確認ください。トップページから各セクションへ移動できます。</p>
    <div class="cta-row">
      <a class="btn btn-primary" href="/">← トップページに戻る</a>
      <a class="btn btn-ghost" href="/#watch">作品を観る</a>
    </div>
  </div>
</main>

<?php get_footer(); ?>
