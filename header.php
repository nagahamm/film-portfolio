<?php
/**
 * 共通の頭。ページごとの値は get_header() の第2引数で受け取る。
 *   title       <title>
 *   description <meta name="description">(省略可)
 *   robots      <meta name="robots">(省略可)
 *   nav_base    ナビのリンクの前に付ける URL(作品ページ以外から各セクションへ飛ぶとき)
 */

$args = wp_parse_args( $args, [ 'title' => '', 'description' => '', 'robots' => '', 'nav_base' => '' ] );
?>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<?php if ( $args['description'] ) : ?>
<meta name="description" content="<?php echo esc_attr( $args['description'] ); ?>">
<?php endif; ?>
<?php if ( $args['robots'] ) : ?>
<meta name="robots" content="<?php echo esc_attr( $args['robots'] ); ?>">
<?php endif; ?>
<title><?php echo esc_html( $args['title'] ); ?></title>
<?php wp_head(); ?>
</head>
<body>

<header class="topbar">
  <div class="wrap">
    <div class="name">光輝 <span>/</span> Portfolio</div>
    <nav>
      <a href="<?php echo esc_attr( $args['nav_base'] ); ?>#watch">Watch</a>
      <a href="<?php echo esc_attr( $args['nav_base'] ); ?>#slate">Slate</a>
      <a href="<?php echo esc_attr( $args['nav_base'] ); ?>#craft">Craft</a>
      <a href="<?php echo esc_attr( $args['nav_base'] ); ?>#onset">Approach</a>
      <a href="<?php echo esc_attr( $args['nav_base'] ); ?>#process">Process</a>
      <a href="<?php echo esc_attr( $args['nav_base'] ); ?>#materials">Materials</a>
    </nav>
  </div>
</header>

