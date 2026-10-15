<?php
/**
 * 共通の頭。ページごとの値は get_header() の第2引数で受け取る。
 *   title       <title>
 *   description <meta name="description">(省略可)
 *   robots      <meta name="robots">(省略可)
 *   nav         ナビのリンク([リンク先, 表示名] の並び)
 */

$args = wp_parse_args( $args, [ 'title' => '', 'description' => '', 'robots' => '', 'nav' => [] ] );
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
<?php foreach ( $args['nav'] as [ $href, $label ] ) : ?>
      <a href="<?php echo esc_attr( $href ); ?>"><?php echo esc_html( $label ); ?></a>
<?php endforeach; ?>
    </nav>
  </div>
</header>

