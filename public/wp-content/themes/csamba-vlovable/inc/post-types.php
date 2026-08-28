<?php
/**
 * Custom Post Types e taxonomias.
 *
 * @package CSamba
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Registra os CPTs do portal.
 */
function csamba_register_post_types() {
	$types = array(
		'banda'  => array(
			'singular' => __( 'Banda', 'csamba' ),
			'plural'   => __( 'Bandas', 'csamba' ),
			'slug'     => 'bandas',
			'icon'     => 'dashicons-groups',
			'supports' => array( 'title', 'editor', 'excerpt', 'thumbnail' ),
		),
		'casa'   => array(
			'singular' => __( 'Casa', 'csamba' ),
			'plural'   => __( 'Casas', 'csamba' ),
			'slug'     => 'casas',
			'icon'     => 'dashicons-store',
			'supports' => array( 'title', 'editor', 'excerpt', 'thumbnail' ),
		),
		'evento' => array(
			'singular' => __( 'Evento', 'csamba' ),
			'plural'   => __( 'Agenda', 'csamba' ),
			'slug'     => 'agenda',
			'icon'     => 'dashicons-calendar-alt',
			'supports' => array( 'title', 'editor', 'thumbnail' ),
		),
		'coluna' => array(
			'singular' => __( 'Coluna', 'csamba' ),
			'plural'   => __( 'Colunas', 'csamba' ),
			'slug'     => 'colunas',
			'icon'     => 'dashicons-edit-large',
			'supports' => array( 'title', 'editor', 'excerpt', 'thumbnail' ),
		),
		'musica' => array(
			'singular' => __( 'Música', 'csamba' ),
			'plural'   => __( 'Músicas', 'csamba' ),
			'slug'     => 'musicas',
			'icon'     => 'dashicons-format-audio',
			'supports' => array( 'title', 'editor', 'thumbnail' ),
		),
		'letra'  => array(
			'singular' => __( 'Letra', 'csamba' ),
			'plural'   => __( 'Letras', 'csamba' ),
			'slug'     => 'letras',
			'icon'     => 'dashicons-media-text',
			'supports' => array( 'title', 'editor' ),
		),
	);

	foreach ( $types as $key => $type ) {
		$labels = array(
			'name'               => $type['plural'],
			'singular_name'      => $type['singular'],
			'add_new_item'       => sprintf( __( 'Adicionar %s', 'csamba' ), $type['singular'] ),
			'edit_item'          => sprintf( __( 'Editar %s', 'csamba' ), $type['singular'] ),
			'search_items'       => sprintf( __( 'Buscar %s', 'csamba' ), $type['plural'] ),
			'not_found'          => __( 'Nenhum registro encontrado.', 'csamba' ),
			'menu_name'          => $type['plural'],
		);

		register_post_type(
			$key,
			array(
				'labels'        => $labels,
				'public'        => true,
				'has_archive'   => true,
				'show_in_rest'  => true,
				'menu_icon'     => $type['icon'],
				'supports'      => $type['supports'],
				'rewrite'       => array( 'slug' => $type['slug'], 'with_front' => false ),
			)
		);
	}

	register_taxonomy(
		'estilo',
		array( 'banda', 'musica' ),
		array(
			'labels'       => array(
				'name'          => __( 'Estilos', 'csamba' ),
				'singular_name' => __( 'Estilo', 'csamba' ),
			),
			'public'       => true,
			'hierarchical' => true,
			'show_in_rest' => true,
			'rewrite'      => array( 'slug' => 'estilo' ),
		)
	);

	register_taxonomy(
		'editoria',
		array( 'coluna' ),
		array(
			'labels'       => array(
				'name'          => __( 'Editorias', 'csamba' ),
				'singular_name' => __( 'Editoria', 'csamba' ),
			),
			'public'       => true,
			'hierarchical' => true,
			'show_in_rest' => true,
			'rewrite'      => array( 'slug' => 'editoria' ),
		)
	);
}
add_action( 'init', 'csamba_register_post_types' );

/**
 * Reescreve permalinks na ativação do tema.
 */
function csamba_flush_rewrites() {
	csamba_register_post_types();
	flush_rewrite_rules();
}
add_action( 'after_switch_theme', 'csamba_flush_rewrites' );
