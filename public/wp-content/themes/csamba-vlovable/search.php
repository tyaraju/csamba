<?php
/**
 * Resultados de busca.
 *
 * @package CSamba
 */

get_header();
?>
<div class="container stack">
	<?php csamba_breadcrumb( array( __( 'busca', 'csamba' ) => null ) ); ?>

	<header class="card page-hero">
		<h1><?php esc_html_e( 'Busca', 'csamba' ); ?></h1>
		<p><?php echo esc_html( sprintf( __( 'Resultados para "%s".', 'csamba' ), get_search_query() ) ); ?></p>
	</header>

	<div class="stack">
		<?php if ( have_posts() ) : ?>
			<?php
			while ( have_posts() ) :
				the_post();
				get_template_part( 'template-parts/news-card', null, array( 'post_id' => get_the_ID() ) );
			endwhile;
			?>
		<?php else : ?>
			<div class="card card-pad"><p><?php esc_html_e( 'Nada encontrado. Tente outro termo.', 'csamba' ); ?></p></div>
		<?php endif; ?>
	</div>

	<div class="pagination">
		<span><?php previous_posts_link( '&larr; ' . esc_html__( 'anterior', 'csamba' ) ); ?></span>
		<span><?php next_posts_link( esc_html__( 'próximo', 'csamba' ) . ' &rarr;' ); ?></span>
	</div>
</div>
<?php
get_footer();
