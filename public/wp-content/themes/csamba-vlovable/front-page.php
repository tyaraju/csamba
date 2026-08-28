<?php
/**
 * Home do portal.
 *
 * @package CSamba
 */

get_header();

$csamba_hero_posts = csamba_featured_posts( 'post', 2 );
$csamba_hero       = ! empty( $csamba_hero_posts[0] ) ? $csamba_hero_posts[0] : null;
$csamba_feature    = ! empty( $csamba_hero_posts[1] ) ? $csamba_hero_posts[1] : $csamba_hero;
$csamba_highlights = get_posts( array( 'post_type' => array( 'post', 'banda', 'coluna' ), 'posts_per_page' => 7 ) );
$csamba_colors     = array( '#8b32d6', '#1a6dff', '#e0348a', '#f2a413', '#e0483a', '#7bbd2a', '#12a58c' );
$csamba_house      = csamba_featured_posts( 'casa', 1 );
$csamba_bands      = csamba_featured_posts( 'banda', 3 );
$csamba_news       = get_posts( array( 'post_type' => 'post', 'posts_per_page' => 5 ) );
$csamba_columns    = get_posts( array( 'post_type' => 'coluna', 'posts_per_page' => 3 ) );
?>

<div class="container stack">

	<!-- Destaques -->
	<section class="grid grid-hero">
		<?php if ( $csamba_hero ) : ?>
			<a class="hero-media" href="<?php echo esc_url( get_permalink( $csamba_hero->ID ) ); ?>">
				<?php csamba_thumbnail( $csamba_hero->ID, 'csamba-hero' ); ?>
			</a>
		<?php endif; ?>

		<?php if ( $csamba_feature ) : ?>
			<article class="hero-feature">
				<h2><?php echo esc_html( get_the_title( $csamba_feature->ID ) ); ?></h2>
				<p><?php echo esc_html( wp_trim_words( get_the_excerpt( $csamba_feature->ID ), 40 ) ); ?></p>
				<a class="btn" href="<?php echo esc_url( get_permalink( $csamba_feature->ID ) ); ?>"><?php esc_html_e( 'Veja mais', 'csamba' ); ?></a>
			</article>
		<?php endif; ?>

		<div class="highlights">
			<p class="highlights-title">
				<?php esc_html_e( 'Outros destaques', 'csamba' ); ?>
				<small><?php esc_html_e( 'clique abaixo para ver os outros destaques', 'csamba' ); ?></small>
			</p>
			<?php foreach ( $csamba_highlights as $csamba_index => $csamba_item ) : ?>
				<a class="highlight-pill" style="background:<?php echo esc_attr( $csamba_colors[ $csamba_index % count( $csamba_colors ) ] ); ?>" href="<?php echo esc_url( get_permalink( $csamba_item->ID ) ); ?>">
					<?php echo esc_html( wp_trim_words( get_the_title( $csamba_item->ID ), 5 ) ); ?>
				</a>
			<?php endforeach; ?>
		</div>
	</section>

	<!-- Casas e bandas -->
	<section class="grid grid-2">
		<div>
			<h2 class="section-title">
				<span class="kicker"><?php esc_html_e( 'Casas', 'csamba' ); ?></span>
				<span class="main"><?php esc_html_e( 'de samba e pagode', 'csamba' ); ?></span>
			</h2>
			<?php if ( ! empty( $csamba_house[0] ) ) : ?>
				<article class="card card-pad house-card">
					<a href="<?php echo esc_url( get_permalink( $csamba_house[0]->ID ) ); ?>"><?php csamba_thumbnail( $csamba_house[0]->ID, 'csamba-thumb' ); ?></a>
					<div>
						<h3><a href="<?php echo esc_url( get_permalink( $csamba_house[0]->ID ) ); ?>"><?php echo esc_html( get_the_title( $csamba_house[0]->ID ) ); ?></a></h3>
						<p><?php echo esc_html( wp_trim_words( get_the_excerpt( $csamba_house[0]->ID ), 26 ) ); ?></p>
					</div>
				</article>
			<?php endif; ?>
			<?php if ( get_post_type_archive_link( 'casa' ) ) : ?>
				<p style="margin-top:14px;"><a class="btn btn-ghost" href="<?php echo esc_url( get_post_type_archive_link( 'casa' ) ); ?>"><?php esc_html_e( 'Veja outras casas', 'csamba' ); ?></a></p>
			<?php endif; ?>
		</div>

		<div>
			<div class="section-head">
				<h2 class="section-title" style="margin:0;">
					<span class="kicker"><?php esc_html_e( 'Bandas', 'csamba' ); ?></span>
					<span class="main"><?php esc_html_e( 'em destaque', 'csamba' ); ?></span>
				</h2>
				<?php if ( get_post_type_archive_link( 'banda' ) ) : ?>
					<a class="btn" href="<?php echo esc_url( get_post_type_archive_link( 'banda' ) ); ?>"><?php esc_html_e( 'Veja todas as bandas', 'csamba' ); ?></a>
				<?php endif; ?>
			</div>
			<div class="grid grid-3">
				<?php foreach ( $csamba_bands as $csamba_band ) : ?>
					<?php get_template_part( 'template-parts/band-card', null, array( 'post_id' => $csamba_band->ID ) ); ?>
				<?php endforeach; ?>
			</div>
		</div>
	</section>

	<!-- Novidades + agenda -->
	<section class="grid grid-2">
		<div>
			<h2 class="section-title">
				<span class="kicker"><?php esc_html_e( 'Novidades', 'csamba' ); ?></span>
				<span class="main"><?php bloginfo( 'name' ); ?></span>
			</h2>
			<div class="stack">
				<?php foreach ( $csamba_news as $csamba_item ) : ?>
					<?php get_template_part( 'template-parts/news-card', null, array( 'post_id' => $csamba_item->ID ) ); ?>
				<?php endforeach; ?>
			</div>
			<div class="pagination">
				<a class="btn btn-ghost" href="<?php echo esc_url( home_url( '/blog/' ) ); ?>">&larr; <?php esc_html_e( 'anterior', 'csamba' ); ?></a>
				<a class="btn btn-ghost" href="<?php echo esc_url( home_url( '/blog/' ) ); ?>"><?php esc_html_e( 'próximo', 'csamba' ); ?> &rarr;</a>
			</div>
		</div>

		<div class="stack">
			<?php get_template_part( 'template-parts/agenda', null, array( 'kicker' => __( 'Agenda', 'csamba' ), 'main' => get_bloginfo( 'name' ) ) ); ?>
			<?php get_template_part( 'template-parts/promo-cards' ); ?>

			<?php if ( $csamba_columns ) : ?>
				<section>
					<h2 class="section-title">
						<span class="kicker"><?php esc_html_e( 'Colunas', 'csamba' ); ?></span>
						<span class="main"><?php bloginfo( 'name' ); ?></span>
					</h2>
					<div class="grid grid-3">
						<?php
						foreach ( $csamba_columns as $csamba_column ) :
							$csamba_terms = get_the_terms( $csamba_column->ID, 'editoria' );
							?>
							<article class="card card-pad column-card">
								<p class="meta">
									<?php echo $csamba_terms && ! is_wp_error( $csamba_terms ) ? esc_html( $csamba_terms[0]->name ) : esc_html__( 'Coluna', 'csamba' ); ?>
									<span class="date"><?php echo esc_html( get_the_date( 'j M Y', $csamba_column->ID ) ); ?></span>
								</p>
								<h3><a href="<?php echo esc_url( get_permalink( $csamba_column->ID ) ); ?>"><?php echo esc_html( get_the_title( $csamba_column->ID ) ); ?></a></h3>
								<?php csamba_thumbnail( $csamba_column->ID, 'csamba-thumb' ); ?>
								<p><?php echo esc_html( wp_trim_words( get_the_excerpt( $csamba_column->ID ), 22 ) ); ?></p>
								<a href="<?php echo esc_url( get_permalink( $csamba_column->ID ) ); ?>"><em><?php esc_html_e( 'clique aqui', 'csamba' ); ?></em></a>
							</article>
						<?php endforeach; ?>
					</div>
				</section>
			<?php endif; ?>
		</div>
	</section>

</div>

<?php
get_footer();
