<?php
/**
 * トップ = 作品一覧。公開中の作品を「順序」の小さい順(同じなら新しい順)に並べる。
 * カードは Watch の本編カード(.film-card)を使い回し、押すと作品ページへ移る。
 */

$works = get_posts( [
	'post_type'   => 'work',
	'numberposts' => -1,
	'orderby'     => [ 'menu_order' => 'ASC', 'date' => 'DESC' ],
] );

get_header( null, [ 'title' => 'SHORT FILM PORTFOLIO — 光輝' ] );
?>

<section class="hero">
<?php get_template_part( 'template-parts/part-hero-land' ); ?>
  <div class="wrap">
    <div class="eyebrow">SHORT FILM PORTFOLIO</div>
    <h1>光輝</h1>
  </div>
</section>

<section class="works-section" id="works">
  <div class="wrap">
    <div class="eyebrow">Works</div>
    <h2>作品一覧</h2>
    <div class="works-grid">
<?php foreach ( $works as $work ) : ?>
      <a class="film-card" href="<?php echo esc_url( get_permalink( $work ) ); ?>">
        <img class="film-card-poster" src="<?php echo esc_url( get_field( 'film_poster', $work->ID ) ); ?>" alt="" loading="lazy" decoding="async">
        <span class="film-card-meta">
          <span class="eyebrow">Short Film — <?php echo esc_html( get_field( 'runtime', $work->ID ) ); ?></span>
          <span class="film-card-title"><?php echo esc_html( get_the_title( $work ) ); ?></span>
        </span>
      </a>
<?php endforeach; ?>
    </div>
  </div>
</section>

<?php get_footer(); ?>
