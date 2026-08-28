<?php
/**
 * Meta boxes nativas (sem dependência de plugin).
 *
 * @package CSamba
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Definição dos campos por post type.
 *
 * @return array
 */
function csamba_meta_fields() {
	return array(
		'banda'  => array(
			'title'  => __( 'Dados da banda', 'csamba' ),
			'fields' => array(
				'csamba_band_prefix'  => array( 'label' => __( 'Prefixo do nome (ex.: Grupo)', 'csamba' ), 'type' => 'text' ),
				'csamba_band_city'    => array( 'label' => __( 'Cidade', 'csamba' ), 'type' => 'text' ),
				'csamba_band_radio'   => array( 'label' => __( 'URL da rádio / stream', 'csamba' ), 'type' => 'url' ),
				'csamba_band_site'    => array( 'label' => __( 'Site oficial', 'csamba' ), 'type' => 'url' ),
				'csamba_band_social'  => array( 'label' => __( 'Redes sociais (uma URL por linha)', 'csamba' ), 'type' => 'textarea' ),
				'csamba_band_gallery' => array( 'label' => __( 'Galeria — IDs de anexos separados por vírgula', 'csamba' ), 'type' => 'text' ),
				'csamba_featured'     => array( 'label' => __( 'Destacar esta banda', 'csamba' ), 'type' => 'checkbox' ),
			),
		),
		'casa'   => array(
			'title'  => __( 'Dados da casa', 'csamba' ),
			'fields' => array(
				'csamba_house_address' => array( 'label' => __( 'Endereço', 'csamba' ), 'type' => 'text' ),
				'csamba_house_city'    => array( 'label' => __( 'Cidade', 'csamba' ), 'type' => 'text' ),
				'csamba_house_phone'   => array( 'label' => __( 'Telefone', 'csamba' ), 'type' => 'text' ),
				'csamba_featured'      => array( 'label' => __( 'Destacar esta casa', 'csamba' ), 'type' => 'checkbox' ),
			),
		),
		'evento' => array(
			'title'  => __( 'Dados do evento', 'csamba' ),
			'fields' => array(
				'csamba_event_date'  => array( 'label' => __( 'Data', 'csamba' ), 'type' => 'date' ),
				'csamba_event_time'  => array( 'label' => __( 'Horário', 'csamba' ), 'type' => 'time' ),
				'csamba_event_band'  => array( 'label' => __( 'Banda', 'csamba' ), 'type' => 'post', 'post_type' => 'banda' ),
				'csamba_event_house' => array( 'label' => __( 'Casa', 'csamba' ), 'type' => 'post', 'post_type' => 'casa' ),
			),
		),
		'musica' => array(
			'title'  => __( 'Dados da música', 'csamba' ),
			'fields' => array(
				'csamba_event_band' => array( 'label' => __( 'Banda', 'csamba' ), 'type' => 'post', 'post_type' => 'banda' ),
				'csamba_track_url'  => array( 'label' => __( 'URL do áudio/clipe', 'csamba' ), 'type' => 'url' ),
			),
		),
		'letra'  => array(
			'title'  => __( 'Dados da letra', 'csamba' ),
			'fields' => array(
				'csamba_event_band' => array( 'label' => __( 'Banda', 'csamba' ), 'type' => 'post', 'post_type' => 'banda' ),
			),
		),
		'post'   => array(
			'title'  => __( 'Relacionamento CSamba', 'csamba' ),
			'fields' => array(
				'csamba_event_band' => array( 'label' => __( 'Banda relacionada', 'csamba' ), 'type' => 'post', 'post_type' => 'banda' ),
				'csamba_featured'   => array( 'label' => __( 'Destaque na home', 'csamba' ), 'type' => 'checkbox' ),
			),
		),
		'coluna' => array(
			'title'  => __( 'Dados da coluna', 'csamba' ),
			'fields' => array(
				'csamba_column_author' => array( 'label' => __( 'Assinatura', 'csamba' ), 'type' => 'text' ),
			),
		),
	);
}

/**
 * Registra as meta boxes.
 */
function csamba_add_meta_boxes() {
	foreach ( csamba_meta_fields() as $post_type => $box ) {
		add_meta_box( 'csamba-' . $post_type, $box['title'], 'csamba_render_meta_box', $post_type, 'normal', 'high' );
	}
}
add_action( 'add_meta_boxes', 'csamba_add_meta_boxes' );

/**
 * Renderiza a meta box.
 *
 * @param WP_Post $post Post atual.
 */
function csamba_render_meta_box( $post ) {
	$config = csamba_meta_fields();
	if ( empty( $config[ $post->post_type ] ) ) {
		return;
	}

	wp_nonce_field( 'csamba_save_meta', 'csamba_meta_nonce' );

	echo '<table class="form-table"><tbody>';
	foreach ( $config[ $post->post_type ]['fields'] as $key => $field ) {
		$value = get_post_meta( $post->ID, $key, true );
		echo '<tr><th><label for="' . esc_attr( $key ) . '">' . esc_html( $field['label'] ) . '</label></th><td>';

		switch ( $field['type'] ) {
			case 'textarea':
				echo '<textarea class="large-text" rows="4" id="' . esc_attr( $key ) . '" name="' . esc_attr( $key ) . '">' . esc_textarea( $value ) . '</textarea>';
				break;
			case 'checkbox':
				echo '<input type="checkbox" id="' . esc_attr( $key ) . '" name="' . esc_attr( $key ) . '" value="1" ' . checked( $value, '1', false ) . ' />';
				break;
			case 'post':
				wp_dropdown_pages(
					array(
						'post_type'        => $field['post_type'],
						'selected'         => $value,
						'name'             => $key,
						'id'               => $key,
						'show_option_none' => __( '— selecionar —', 'csamba' ),
						'option_none_value' => '',
					)
				);
				break;
			default:
				echo '<input type="' . esc_attr( $field['type'] ) . '" class="regular-text" id="' . esc_attr( $key ) . '" name="' . esc_attr( $key ) . '" value="' . esc_attr( $value ) . '" />';
		}

		echo '</td></tr>';
	}
	echo '</tbody></table>';
}

/**
 * Salva os campos.
 *
 * @param int $post_id ID do post.
 */
function csamba_save_meta( $post_id ) {
	if ( ! isset( $_POST['csamba_meta_nonce'] ) || ! wp_verify_nonce( sanitize_text_field( wp_unslash( $_POST['csamba_meta_nonce'] ) ), 'csamba_save_meta' ) ) {
		return;
	}
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
		return;
	}
	if ( ! current_user_can( 'edit_post', $post_id ) ) {
		return;
	}

	$config    = csamba_meta_fields();
	$post_type = get_post_type( $post_id );
	if ( empty( $config[ $post_type ] ) ) {
		return;
	}

	foreach ( $config[ $post_type ]['fields'] as $key => $field ) {
		if ( 'checkbox' === $field['type'] ) {
			update_post_meta( $post_id, $key, isset( $_POST[ $key ] ) ? '1' : '' );
			continue;
		}

		if ( ! isset( $_POST[ $key ] ) ) {
			continue;
		}

		$raw = wp_unslash( $_POST[ $key ] );

		switch ( $field['type'] ) {
			case 'url':
				$value = esc_url_raw( $raw );
				break;
			case 'textarea':
				$value = sanitize_textarea_field( $raw );
				break;
			case 'post':
				$value = absint( $raw );
				break;
			default:
				$value = sanitize_text_field( $raw );
		}

		update_post_meta( $post_id, $key, $value );
	}
}
add_action( 'save_post', 'csamba_save_meta' );
