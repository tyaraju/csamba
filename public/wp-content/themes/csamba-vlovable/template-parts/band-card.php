<?php
/**
 * Card de banda.
 *
 * @package CSamba
 */

$csamba_band_id = isset( $args['post_id'] ) ? (int) $args['post_id'] : get_the_ID();
?>
<article class="card card-pad band-card">
	<a href="<?php echo esc_url( get_permalink( $csamba_band_id ) ); ?>">
		<?php csamba_thumbnail( $csamba_band_id, 'csamba-card' ); ?>
	</a>
	<h3><a href="<?php echo esc_url( get_permalink( $csamba_band_id ) ); ?>"><?php echo esc_html( get_the_title( $csamba_band_id ) ); ?></a></h3>
	<p><?php echo esc_html( wp_trim_words( get_the_excerpt( $csamba_band_id ), 16 ) ); ?></p>
	<p><a href="<?php echo esc_url( get_permalink( $csamba_band_id ) ); ?>"><em><?php esc_html_e( 'clique aqui', 'csamba' ); ?></em></a></p>
</article>
