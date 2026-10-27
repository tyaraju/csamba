<?php
if (!defined('ABSPATH')) {
  exit;
}

$register_page = get_page_by_path('cadastrar-banda');

$register_url = (
  $register_page instanceof WP_Post
  && get_post_status($register_page) === 'publish'
)
  ? get_permalink($register_page)
  : '';

$logo_url = get_theme_file_uri('/assets/images/logo.png');
$favicon_url = get_template_directory_uri()
  . '/assets/images/favicon/';
?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo('charset'); ?>">
  <meta name="viewport" content="width=device-width,initial-scale=1">

  <link
    rel="icon"
    sizes="16x16"
    href="<?php echo esc_url($favicon_url . 'favicon-16x16.png'); ?>"
  >
  <link
    rel="icon"
    sizes="32x32"
    href="<?php echo esc_url($favicon_url . 'favicon-32x32.png'); ?>"
  >
  <link
    rel="apple-touch-icon"
    sizes="180x180"
    href="<?php echo esc_url($favicon_url . 'apple-touch-icon.png'); ?>"
  >
  <link
    rel="icon"
    sizes="192x192"
    href="<?php echo esc_url($favicon_url . 'android-chrome-192x192.png'); ?>"
  >
  <link
    rel="icon"
    sizes="512x512"
    href="<?php echo esc_url($favicon_url . 'android-chrome-512x512.png'); ?>"
  >

  <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<header class="site-header site-header--modern">

  <div class="topbar">
    <div class="container topbar-inner">

      <form
        role="search"
        method="get"
        class="top-search"
        action="<?php echo esc_url(home_url('/')); ?>"
      >
        <svg
          width="18"
          height="18"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="1.8"
          aria-hidden="true"
        >
          <circle cx="10.5" cy="10.5" r="6.5"/>
          <path d="m16 16 5 5"/>
        </svg>

        <label
          class="screen-reader-text"
          for="csamba-search"
        >
          Buscar no CSamba
        </label>

        <input
          id="csamba-search"
          type="search"
          name="s"
          value="<?php echo esc_attr(get_search_query()); ?>"
          placeholder="Buscar no CSamba"
        >

        <button type="submit">Buscar</button>
      </form>

      <div class="member-links">
        <a href="<?php echo esc_url(wp_login_url()); ?>">
          <svg
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="1.8"
            aria-hidden="true"
          >
            <circle cx="12" cy="7" r="4"/>
            <path d="M4 22v-3a8 8 0 0 1 16 0v3"/>
          </svg>

          Entrar
        </a>
      </div>

    </div>
  </div>

  <div class="container brand-row">
    <a
      class="brand"
      href="<?php echo esc_url(home_url('/')); ?>"
      aria-label="CSamba — página inicial"
    >
      <img
        src="<?php echo esc_url($logo_url); ?>"
        alt="CSamba"
      >
    </a>

    <div class="ad-banner">
      <span>Espaço publicitário</span>
    </div>
  </div>

  <div class="nav-slot">
    <div class="nav-shell">
      <div class="container nav-wrap">

        <a
          class="nav-brand"
          href="<?php echo esc_url(home_url('/')); ?>"
          aria-label="CSamba — página inicial"
        >
          <img
            src="<?php echo esc_url($logo_url); ?>"
            alt="CSamba"
          >
        </a>

        <button
          class="menu-toggle"
          type="button"
          aria-expanded="false"
          aria-controls="csamba-navigation"
          aria-label="Abrir menu principal"
          data-csamba-menu-toggle
        >
          <span class="menu-toggle__lines" aria-hidden="true">
            <span></span>
            <span></span>
            <span></span>
          </span>

          <span class="screen-reader-text">Menu</span>
        </button>

        <div
          id="csamba-navigation"
          class="header-navigation"
        >
          <nav
            id="main-menu"
            class="main-nav"
            aria-label="Menu principal"
          >
            <?php
            wp_nav_menu([
              'theme_location' => 'primary',
              'container'      => false,
              'fallback_cb'    => false,
              'depth'          => 1,
              'menu_class'     => 'main-menu-list',
              'items_wrap'     => '<ul class="%2$s">%3$s</ul>',
            ]);
            ?>
          </nav>

          <?php if ($register_url): ?>
            <a
              class="header-register"
              href="<?php echo esc_url($register_url); ?>"
            >
              Cadastre sua banda
              <span aria-hidden="true">→</span>
            </a>
          <?php endif; ?>
        </div>

      </div>
    </div>
  </div>

</header>

<main id="main" class="site-main">