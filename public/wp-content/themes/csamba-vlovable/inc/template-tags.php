<?php
/**
 * Helpers de template.
 *
 * @package CSamba
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Logo em SVG.
 *
 * @param int $size Tamanho em px.
 */
function csamba_logo_mark( $size = 46 ) {
	printf(
		'<svg class="brand-mark" width="%1$d" height="%1$d" viewBox="0 0 48 48" role="img" aria-hidden="true" focusable="false">
			<circle cx="24" cy="24" r="21" fill="none" stroke="#1a6dff" stroke-width="6" stroke-dasharray="98 34" transform="rotate(-38 24 24)"/>
			<circle cx="24" cy="24" r="10" fill="#14181f"/>
			<circle cx="24" cy="24" r="3.2" fill="#ffffff"/>
		</svg>',
		(int) $size
	);
}

/**
 * Ícone genérico das seções (fotos, rádio, letras, podcast).
 *
 * @param string $name Nome do ícone.
 */
function csamba_icon( $name ) {
	$icons = array(
		'photo'    => '<rect x="6" y="16" width="52" height="36" rx="8" fill="#1a6dff"/><circle cx="32" cy="34" r="11" fill="#fff"/><circle cx="32" cy="34" r="6" fill="#1a6dff"/><rect x="24" y="10" width="16" height="8" rx="3" fill="#1a6dff"/>',
		'radio'    => '<circle cx="32" cy="32" r="24" fill="#e8effb"/><circle cx="32" cy="32" r="16" fill="#1a6dff"/><path d="M28 24l14 8-14 8z" fill="#fff"/>',
		'lyrics'   => '<rect x="12" y="8" width="40" height="48" rx="7" fill="#1a6dff"/><rect x="20" y="20" width="24" height="4" rx="2" fill="#fff"/><rect x="20" y="30" width="24" height="4" rx="2" fill="#fff"/><rect x="20" y="40" width="16" height="4" rx="2" fill="#fff"/>',
		'podcast'  => '<circle cx="32" cy="32" r="24" fill="#efe6ff"/><rect x="26" y="14" width="12" height="24" rx="6" fill="#8b32d6"/><path d="M20 34a12 12 0 0024 0" fill="none" stroke="#8b32d6" stroke-width="4"/><rect x="30" y="44" width="4" height="8" fill="#8b32d6"/>',
		'register' => '<circle cx="32" cy="32" r="24" fill="none" stroke="#8b93a4" stroke-width="7" stroke-dasharray="112 38" transform="rotate(-38 32 32)"/><path d="M26 26c4-4 9-4 12 0 3 4 1 8-6 13-7-5-9-9-6-13z" fill="#8b93a4"/>',
	);

	$path = isset( $icons[ $name ] ) ? $icons[ $name ] : '';

	echo '<svg viewBox="0 0 64 64" role="img" aria-hidden="true" focusable="false">' . $path . '</svg>'; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
}

/**
 * Imagem destacada com fallback.
 *
 * @param int    $post_id ID do post.
 * @param string $size    Tamanho.
 * @param string $class   Classe CSS.
 */
function csamba_thumbnail( $post_id, $size = 'csamba-card', $class = '' ) {
	if ( has_post_thumbnail( $post_id ) ) {
		echo get_the_post_thumbnail( $post_id, $size, array( 'class' => $class, 'loading' => 'lazy', 'alt' => esc_attr( get_the_title( $post_id ) ) ) ); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
		return;
	}

	printf(
		'<div class="%s" style="background:linear-gradient(140deg,#dbe4f3,#f4f6fa);aspect-ratio:4/3;border-radius:8px;"></div>',
		esc_attr( $class )
	);
}

/**
 * Nome da banda dividido em prefixo + nome.
 *
 * @param int    $post_id ID da banda.
 * @param string $class   Classe do título.
 */
function csamba_band_title( $post_id, $class = 'band-title' ) {
	$prefix = get_post_meta( $post_id, 'csamba_band_prefix', true );

	printf(
		'<h1 class="%s">%s<span class="name">%s</span></h1>',
		esc_attr( $class ),
		$prefix ? '<span class="pre">' . esc_html( $prefix ) . '</span>' : '',
		esc_html( get_the_title( $post_id ) )
	);
}

/**
 * Breadcrumb simples.
 *
 * @param array $items Itens extras: array( 'label' => 'url|null' ).
 */
function csamba_breadcrumb( $items = array() ) {
	$parts = array( '<a href="' . esc_url( home_url( '/' ) ) . '">home</a>' );

	foreach ( $items as $label => $url ) {
		$parts[] = $url ? '<a href="' . esc_url( $url ) . '">' . esc_html( $label ) . '</a>' : esc_html( $label );
	}

	echo '<nav class="breadcrumb" aria-label="' . esc_attr__( 'Você está aqui', 'csamba' ) . '">' . implode( ' &raquo; ', $parts ) . '</nav>'; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
}

/**
 * Próximos eventos agrupados por dia da semana.
 *
 * @param int      $limit   Quantidade de eventos.
 * @param int|null 	$band_id Filtra por banda.
 * @return array
 */
function csamba_agenda_by_weekday( $limit = 12, $band_id = null ) {
	$args = array(
		'post_type'      => 'evento',
		'posts_per_page' => $limit,
		'meta_key'       => 'csamba_event_date',
		'orderby'        => 'meta_value',
		'order'          => 'ASC',
		'meta_query'     => array(
			array(
				'key'     => 'csamba_event_date',
				'value'   => gmdate( 'Y-m-d' ),
				'compare' => '>=',
				'type'    => 'DATE',
			),
		),
	);

	if ( $band_id ) {
		$args['meta_query'][] = array(
			'key'   => 'csamba_event_band',
			'value' => (int) $band_id,
		);
	}

	$events   = get_posts( $args );
	$weekdays = array( 'DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB' );
	$grouped  = array();

	foreach ( $events as $event ) {
		$date = get_post_meta( $event->ID, 'csamba_event_date', true );
		if ( ! $date ) {
			continue;
		}
		$key = $weekdays[ (int) gmdate( 'w', strtotime( $date ) ) ];
		$grouped[ $key ][] = $event;
	}

	return $grouped;
}

/**
 * Consulta de posts com destaque, com fallback para os mais recentes.
 *
 * @param string $post_type Post type.
 * @param int    $limit     Quantidade.
 * @return WP_Post[]
 */
function csamba_featured_posts( $post_type, $limit = 3 ) {
	$featured = get_posts(
		array(
			'post_type'      => $post_type,
			'posts_per_page' => $limit,
			'meta_key'       => 'csamba_featured',
			'meta_value'     => '1',
		)
	);

	if ( count( $featured ) >= $limit ) {
		return $featured;
	}

	$fill = get_posts(
		array(
			'post_type'      => $post_type,
			'posts_per_page' => $limit - count( $featured ),
			'post__not_in'   => wp_list_pluck( $featured, 'ID' ),
		)
	);

	return array_merge( $featured, $fill );
}

/**
 * Posts relacionados a uma banda.
 *
 * @param int    $band_id   ID da banda.
 * @param string $post_type Post type.
 * @param int    $limit     Quantidade.
 * @return WP_Post[]
 */
function csamba_posts_for_band( $band_id, $post_type = 'post', $limit = 4 ) {
	return get_posts(
		array(
			'post_type'      => $post_type,
			'posts_per_page' => $limit,
			'meta_query'     => array(
				array(
					'key'   => 'csamba_event_band',
					'value' => (int) $band_id,
				),
			),
		)
	);
}

/**
 * Lista de links a partir de um array de posts.
 *
 * @param WP_Post[] $posts Posts.
 * @param string    $empty Mensagem quando vazio.
 * @return string
 */
function csamba_list_links( $posts, $empty ) {
	if ( empty( $posts ) ) {
		return '<p>' . esc_html( $empty ) . '</p>';
	}

	$items = '';
	foreach ( $posts as $item ) {
		$items .= '<li><a href="' . esc_url( get_permalink( $item->ID ) ) . '">' . esc_html( get_the_title( $item->ID ) ) . '</a></li>';
	}

	return '<ul>' . $items . '</ul>';
}
