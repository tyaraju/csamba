<?php
/**
 * Cabeçalho do site.
 *
 * @package CSamba
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>
<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Pular para o conteúdo', 'csamba' ); ?></a>

<div class="topbar">
	<div class="container">
		<form class="topbar-search" role="search" method="get" action="<?php echo esc_url( home_url( '/' ) ); ?>">
			<label class="screen-reader-text" for="csamba-search"><?php esc_html_e( 'Buscar', 'csamba' ); ?></label>
			<input id="csamba-search" type="search" name="s" placeholder="<?php esc_attr_e( 'busca', 'csamba' ); ?>" value="<?php echo esc_attr( get_search_query() ); ?>" />
			<button class="btn" type="submit"><?php esc_html_e( 'Buscar', 'csamba' ); ?></button>
		</form>
		<div class="topbar-links">
			<?php
			if ( has_nav_menu( 'topbar' ) ) {
				wp_nav_menu(
					array(
						'theme_location' => 'topbar',
						'container'      => false,
						'menu_class'     => 'menu',
						'depth'          => 1,
					)
				);
			} else {
				?>
				<a href="<?php echo esc_url( home_url( '/cadastrar-banda/' ) ); ?>"><?php esc_html_e( 'cadastre sua banda', 'csamba' ); ?></a>
				<span aria-hidden="true">|</span>
				<a href="<?php echo esc_url( wp_login_url() ); ?>"><?php esc_html_e( 'logar', 'csamba' ); ?></a>
				<?php
			}
			?>
		</div>
	</div>
</div>

<header class="site-header">
	<div class="container header-inner">
		<a class="brand" href="<?php echo esc_url( home_url( '/' ) ); ?>">
			<?php csamba_logo_mark(); ?>
			<span class="brand-text">
				<span class="brand-name"><?php bloginfo( 'name' ); ?></span>
				<span class="brand-tag"><?php echo esc_html( get_bloginfo( 'description' ) ? get_bloginfo( 'description' ) : __( 'A sua casa do samba', 'csamba' ) ); ?></span>
			</span>
		</a>
		<?php if ( is_active_sidebar( 'sidebar-1' ) ) : ?>
			<div class="header-banner"><?php dynamic_sidebar( 'sidebar-1' ); ?></div>
		<?php endif; ?>
	</div>
</header>

<nav class="site-nav" aria-label="<?php esc_attr_e( 'Menu principal', 'csamba' ); ?>">
	<div class="container">
		<button class="nav-toggle" type="button" aria-expanded="false"><?php esc_html_e( 'Menu', 'csamba' ); ?></button>
		<?php
		wp_nav_menu(
			array(
				'theme_location' => 'primary',
				'container'      => false,
				'menu_class'     => 'menu',
				'depth'          => 1,
				'fallback_cb'    => 'csamba_default_menu',
			)
		);
		?>
		<?php do_action( 'csamba_breadcrumb' ); ?>
	</div>
</nav>

<main id="content" class="site-main">
<?php
/**
 * Menu padrão quando nenhum menu foi atribuído.
 */
function csamba_default_menu() {
	$links = array(
		__( 'Bandas', 'csamba' )          => get_post_type_archive_link( 'banda' ),
		__( 'Colunas', 'csamba' )         => get_post_type_archive_link( 'coluna' ),
		__( 'Agenda', 'csamba' )          => get_post_type_archive_link( 'evento' ),
		__( 'Casas', 'csamba' )           => get_post_type_archive_link( 'casa' ),
		__( 'Músicas', 'csamba' )         => get_post_type_archive_link( 'musica' ),
		__( 'Cadastrar banda', 'csamba' ) => home_url( '/cadastrar-banda/' ),
	);

	echo '<ul class="menu">';
	foreach ( $links as $label => $url ) {
		if ( ! $url ) {
			continue;
		}
		echo '<li><a href="' . esc_url( $url ) . '">' . esc_html( $label ) . '</a></li>';
	}
	echo '</ul>';
}
