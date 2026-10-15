<?php
/**
 * Watch — 本編カード、ショットリストの帯、実績カード。
 * 本編カードは作品の基本項目(タイトル・尺・ポスター・本編)から作る。
 */

$section = fp_section( 'watch' );
if ( ! $section ) {
	return;
}
$work = get_queried_object_id();
?>
<section class="watch-section" id="watch">
  <div class="wrap fade">
    <div class="eyebrow">Watch</div>
    <div class="film-card-wrap">
      <button type="button" class="film-card" id="open-film-modal" aria-label="本編「<?php echo esc_attr( get_the_title( $work ) ); ?>」を再生する">
        <img class="film-card-poster" src="<?php echo esc_url( get_field( 'film_poster', $work ) ); ?>" alt="" loading="lazy" decoding="async">
        <span class="film-card-meta">
          <span class="eyebrow">Short Film — <?php echo esc_html( get_field( 'runtime', $work ) ); ?></span>
          <span class="film-card-title"><?php echo esc_html( get_the_title( $work ) ); ?></span>
        </span>
      </button>
<?php if ( get_field( 'film_video', $work ) ) : ?>
      <p class="ig-fallback">再生されない場合は <button type="button" id="open-video-modal" class="direct-play-btn">こちら</button> から直接再生する。</p>
<?php endif; ?>
    </div>

<?php if ( $section['shots'] ) : ?>
    <div class="shotlist-marquee" aria-label="ショットリスト参考画像ギャラリー">
      <div class="shotlist-track">
<?php foreach ( $section['shots'] as $shot ) : ?>
          <img src="<?php echo esc_url( $shot['image'] ); ?>" alt="<?php echo esc_attr( $shot['alt'] ); ?>" data-album="shotlist" loading="lazy" decoding="async">
<?php endforeach; ?>
      </div>
    </div>
<?php endif; ?>

<?php if ( $section['stats'] ) : ?>
    <div class="stat-cards">
<?php foreach ( $section['stats'] as $stat ) : ?>
      <div class="stat-card">
        <div class="stat-main"><?php echo esc_html( $stat['label'] ); ?> <span class="stat-num"><?php echo esc_html( $stat['number'] ); ?></span><?php echo $stat['unit'] ? ' ' . esc_html( $stat['unit'] ) : ''; ?></div>
        <div class="stat-foot">
          <span class="stat-sub"><?php echo esc_html( $stat['sub'] ); ?></span>
<?php if ( $stat['url'] ) : ?>
          <a class="stat-arrow" href="<?php echo esc_url( $stat['url'] ); ?>" target="_blank" rel="noopener" aria-label="<?php echo esc_attr( $stat['link_label'] ); ?>">
            <span class="arrow-tip">アカウントへ</span>
            <span>→</span>
          </a>
<?php endif; ?>
        </div>
      </div>
<?php endforeach; ?>
    </div>
<?php endif; ?>
  </div>
</section>
