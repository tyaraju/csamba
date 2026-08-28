<?php
/**
 * Archives genéricos (casas, agenda, colunas, músicas, letras, taxonomias).
 *
 * @package CSamba
 */

get_header();
?>
<div class="container stack">
	<?php csamba_breadcrumb( array( wp_strip_all_tags( get_the_archive_title() ) => null ) ); ?>

	<header class="card page-hero">
		<h1><?php echo esc_html( wp_strip_all_tags( get_the_archive_title() ) ); ?></h1>
		<?php if ( get_the_archive_description() ) : ?>
			<p><?php echo esc_html( wp_strip_all_tags( get_the_archive_description() ) ); ?></p>
		<?php endif; ?>
	</header>

	<?php if ( have_posts() ) : ?>
		<div class="grid grid-3">
			<?php
			while ( have_posts() ) :
				the_post();
				get_template_part( 'template-parts/band-card', null, array( 'post_id' => get_the_ID() ) );
			endwhile;
			?>
		</div>
	<?php else : ?>
		<div class="card card-pad"><p><?php esc_html_e( 'Nenhum registro encontrado.', 'csamba' ); ?></p></div>
	<?php endif; ?>

	<div class="pagination">
		<span><?php previous_posts_link( '&larr; ' . esc_html__( 'anterior', 'csamba' ) ); ?></span>
		<span><?php next_posts_link( esc_html__( 'próximo', 'csamba' ) . ' &rarr;' ); ?></span>
	</div>
</div>
<?php
get_footer();
