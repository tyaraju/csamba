<?php
/**
 * Post e CPTs sem template próprio.
 *
 * @package CSamba
 */

get_header();

while ( have_posts() ) :
	the_post();
	$csamba_band_id = (int) get_post_meta( get_the_ID(), 'csamba_event_band', true );
	?>
	<div class="container stack">
		<?php csamba_breadcrumb( array( get_the_title() => null ) ); ?>

		<article class="card card-pad">
			<p class="news-date"><?php echo esc_html( get_the_date( 'j \d\e F \d\e Y' ) ); ?></p>
			<h1 style="margin-top:0;"><?php the_title(); ?></h1>
			<?php if ( has_post_thumbnail() ) : ?>
				<?php the_post_thumbnail( 'csamba-hero', array( 'style' => 'border-radius:12px;margin:16px 0;' ) ); ?>
			<?php endif; ?>
			<div class="entry-content"><?php the_content(); ?></div>

			<?php if ( $csamba_band_id ) : ?>
				<p style="margin-top:20px;">
					<a class="btn" href="<?php echo esc_url( get_permalink( $csamba_band_id ) ); ?>">
						<?php echo esc_html( sprintf( __( 'Ver a página de %s', 'csamba' ), get_the_title( $csamba_band_id ) ) ); ?>
					</a>
				</p>
			<?php endif; ?>
		</article>

		<?php
		if ( comments_open() || get_comments_number() ) {
			echo '<div class="card card-pad">';
			comments_template();
			echo '</div>';
		}
		?>
	</div>
	<?php
endwhile;

get_footer();
