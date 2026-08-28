<?php
/**
 * Card de notícia.
 *
 * @package CSamba
 */

$csamba_post_id = isset( $args['post_id'] ) ? (int) $args['post_id'] : get_the_ID();
$csamba_thumb   = has_post_thumbnail( $csamba_post_id );
?>
<article class="card">
	<div class="news-item <?php echo $csamba_thumb ? 'news-with-thumb' : ''; ?>">
		<?php if ( $csamba_thumb ) : ?>
			<a href="<?php echo esc_url( get_permalink( $csamba_post_id ) ); ?>">
				<?php csamba_thumbnail( $csamba_post_id, 'csamba-thumb' ); ?>
			</a>
		<?php endif; ?>
		<div>
			<p class="news-date"><?php echo esc_html( get_the_date( 'j \d\e F \d\e Y', $csamba_post_id ) ); ?></p>
			<h3><a href="<?php echo esc_url( get_permalink( $csamba_post_id ) ); ?>"><?php echo esc_html( get_the_title( $csamba_post_id ) ); ?></a></h3>
			<p><?php echo esc_html( wp_trim_words( get_the_excerpt( $csamba_post_id ), 34 ) ); ?></p>
		</div>
	</div>
	<div class="news-foot">
		<a class="btn" href="<?php echo esc_url( get_permalink( $csamba_post_id ) ); ?>"><?php esc_html_e( 'Veja toda a notícia', 'csamba' ); ?></a>
		<a href="<?php echo esc_url( 'mailto:?subject=' . rawurlencode( get_the_title( $csamba_post_id ) ) . '&body=' . rawurlencode( get_permalink( $csamba_post_id ) ) ); ?>">
			<?php esc_html_e( 'Divulgue essa notícia', 'csamba' ); ?>
		</a>
	</div>
</article>
