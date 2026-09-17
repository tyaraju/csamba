<?php if (!defined('ABSPATH')) exit; ?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo('charset'); ?>">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="icon" sizes="16x16" href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/favicon/favicon-16x16.png">
  <link rel="icon" sizes="32x32" href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/favicon/favicon-32x32.png">
  <link rel="apple-touch-icon" sizes="180x180" href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/favicon/apple-touch-icon.png">
  <link rel="icon" sizes="192x192" href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/favicon/android-chrome-192x192.png">
  <link rel="icon" sizes="512x512" href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/favicon/android-chrome-512x512.png">
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>
<header class="site-header">
  <div class="topbar">
    <div class="container topbar-inner">
      <form role="search" method="get" class="top-search" action="<?php echo esc_url(home_url('/')); ?>">
        <span aria-hidden="true">⌕</span>
        <label class="screen-reader-text" for="csamba-search">Busca</label>
        <input id="csamba-search" type="search" name="s" value="<?php echo esc_attr(get_search_query()); ?>" placeholder="Buscar no CSamba">
        <button>BUSCAR</button>
      </form>
      <div class="member-links"><a href="#">cadastre sua banda</a><span>•</span><a href="<?php echo esc_url(wp_login_url()); ?>">entrar</a></div>
    </div>
  </div>
  <div class="container brand-row">
    <a class="brand" href="<?php echo esc_url(home_url('/')); ?>" aria-label="CSamba — página inicial">
      <img src="<?php echo esc_url(get_theme_file_uri('/assets/images/logo.jpg')); ?>" alt="CSamba">
    </a>
    <div class="ad-banner"><span>Espaço publicitário</span></div>
  </div>
  <div class="nav-shell">
    <div class="container nav-wrap">
      <button class="menu-toggle" type="button" aria-expanded="false" aria-controls="main-menu">Menu</button>
      <nav id="main-menu" class="main-nav" aria-label="Menu principal">
        <?php
        if (has_nav_menu('primary')) {
          wp_nav_menu(['theme_location'=>'primary','container'=>false,'fallback_cb'=>false,'items_wrap'=>'<ul>%3$s</ul>']);
        } else {
          echo '<ul>';
          $items = [
            ['BANDAS', get_post_type_archive_link('banda') ?: home_url('/bandas/'), '#f3c11b'],
            ['COLUNAS', get_post_type_archive_link('coluna') ?: home_url('/coluna/'), '#3aa0d8'],
            ['AGENDA', get_post_type_archive_link('evento') ?: home_url('/agenda/'), '#e04f73'],
            ['CASAS', get_post_type_archive_link('casa') ?: home_url('/casa/'), '#3da26d'],
            ['MÚSICAS', '#', '#f08b31'],
            ['CADASTRAR BANDA', '#', '#985fc1'],
          ];
          foreach ($items as [$name,$url,$color]) echo '<li><a style="--menu-accent:'.esc_attr($color).'" href="'.esc_url($url).'">'.esc_html($name).'</a></li>';
          echo '</ul>';
        }
        ?>
      </nav>
    </div>
  </div>
</header>
<main id="main" class="site-main">
