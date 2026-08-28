<?php
/**
 * CSamba — bootstrap do tema.
 *
 * @package CSamba
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

define( 'CSAMBA_VERSION', '1.0.0' );

require_once get_template_directory() . '/inc/post-types.php';
require_once get_template_directory() . '/inc/meta-boxes.php';
require_once get_template_directory() . '/inc/template-tags.php';

/**
 * Suporte do tema.
 */
function csamba_setup() {
	load_theme_textdomain( 'csamba', get_template_directory() . '/languages' );

	add_theme_support( 'title-tag' );
	add_theme_support( 'post-thumbnails' );
	add_theme_support( 'automatic-feed-links' );
	add_theme_support( 'responsive-embeds' );
	add_theme_support( 'html5', array( 'search-form', 'comment-form', 'comment-list', 'gallery', 'caption', 'style', 'script' ) );

	add_image_size( 'csamba-hero', 760, 470, true );
	add_image_size( 'csamba-card', 420, 315, true );
	add_image_size( 'csamba-thumb', 240, 170, true );

	register_nav_menus(
		array(
			'primary' => __( 'Menu principal', 'csamba' ),
			'topbar'  => __( 'Menu do topo', 'csamba' ),
		)
	);
}
add_action( 'after_setup_theme', 'csamba_setup' );

/**
 * Assets.
 */
function csamba_assets() {
	wp_enqueue_style( 'csamba-fonts', 'https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@300;400;700;800&family=Inter:wght@400;500;600;700&display=swap', array(), null );
	wp_enqueue_style( 'csamba-main', get_theme_file_uri( '/assets/css/main.css' ), array(), CSAMBA_VERSION );
	wp_enqueue_style( 'csamba-style', get_stylesheet_uri(), array( 'csamba-main' ), CSAMBA_VERSION );
	wp_enqueue_script( 'csamba-main', get_theme_file_uri( '/assets/js/main.js' ), array(), CSAMBA_VERSION, true );
}
add_action( 'wp_enqueue_scripts', 'csamba_assets' );

/**
 * Áreas de widget.
 */
function csamba_widgets() {
	register_sidebar(
		array(
			'name'          => __( 'Barra lateral', 'csamba' ),
			'id'            => 'sidebar-1',
			'before_widget' => '<section class="card card-pad widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h2 class="section-title"><span class="main">',
			'after_title'   => '</span></h2>',
		)
	);
}
add_action( 'widgets_init', 'csamba_widgets' );

/**
 * Ordena o arquivo de bandas alfabeticamente e mostra todas.
 *
 * @param WP_Query $query Query principal.
 */
function csamba_archive_query( $query ) {
	if ( is_admin() || ! $query->is_main_query() ) {
		return;
	}

	if ( $query->is_post_type_archive( 'banda' ) ) {
		$query->set( 'orderby', 'title' );
		$query->set( 'order', 'ASC' );
		$query->set( 'posts_per_page', -1 );
	}
}
add_action( 'pre_get_posts', 'csamba_archive_query' );
