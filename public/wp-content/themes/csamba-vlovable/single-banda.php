<?php
/**
 * PDP da banda.
 *
 * @package CSamba
 */

get_header();

while ( have_posts() ) :
	the_post();

	$csamba_band_id = get_the_ID();
	$csamba_radio   = get_post_meta( $csamba_band_id, 'csamba_band_radio', true );
	$csamba_gallery = array_filter( array_map( 'absint', explode( ',', (string) get_post_meta( $csamba_band_id, 'csamba_band_gallery', true ) ) ) );
	$csamba_songs   = csamba_posts_for_band( $csamba_band_id, 'musica', 12 );
	$csamba_lyrics  = csamba_posts_for_band( $csamba_band_id, 'letra', 12 );
	$csamba_news    = csamba_posts_for_band( $csamba_band_id, 'post', 4 );

	$csamba_tabs = array(
		'banda'   => array(
			'label'   => __( 'a banda', 'csamba' ),
			'content' => wpautop( get_the_content() ),
		),
		'musicas' => array(
			'label'   => __( 'músicas', 'csamba' ),
			'content' => csamba_list_links( $csamba_songs, __( 'Nenhuma música cadastrada.', 'csamba' ) ),
		),
		'letras'  => array(
			'label'   => __( 'letras', 'csamba' ),
			'content' => csamba_list_links( $csamba_lyrics, __( 'Nenhuma letra cadastrada.', 'csamba' ) ),
		),
		'fotos'   => array(
			'label'   => __( 'fotos', 'csamba' ),
			'content' => $csamba_gallery ? sprintf( '<p>%s</p>', esc_html( sprintf( __( '%d fotos no álbum da banda.', 'csamba' ), count( $csamba_gallery ) ) ) ) : '<p>' . esc_html__( 'Álbum ainda não publicado.', 'csamba' ) . '</p>',
		),
		'radio'   => array(
			'label'   => __( 'rádio', 'csamba' ),
			'content' => $csamba_radio ? '<p><a class="btn" href="' . esc_url( $csamba_radio ) . '">' . esc_html__( 'Ouvir a rádio da banda', 'csamba' ) . '</a></p>' : '<p>' . esc_html__( 'Rádio indisponível.', 'csamba' ) . '</p>',
		),
	);
	?>

	<div class="container stack">
		<?php
		csamba_breadcrumb(
			array(
				__( 'bandas', 'csamba' ) => get_post_type_archive_link( 'banda' ),
				get_the_title()          => null,
			)
		);
		?>

		<article class="card band-hero" data-tabs>
			<?php csamba_thumbnail( $csamba_band_id, 'csamba-hero' ); ?>
			<div class="band-hero-body">
				<ul class="band-tabs" role="tablist">
					<?php
					$csamba_first = true;
					foreach ( $csamba_tabs as $csamba_key => $csamba_tab ) :
						?>
						<li role="presentation">
							<button type="button" role="tab" id="tab-<?php echo esc_attr( $csamba_key ); ?>"
								aria-controls="panel-<?php echo esc_attr( $csamba_key ); ?>"
								aria-selected="<?php echo $csamba_first ? 'true' : 'false'; ?>">
								<?php echo esc_html( $csamba_tab['label'] ); ?>
							</button>
						</li>
						<?php
						$csamba_first = false;
					endforeach;
					?>
				</ul>

				<?php csamba_band_title( $csamba_band_id ); ?>

				<?php
				$csamba_first = true;
				foreach ( $csamba_tabs as $csamba_key => $csamba_tab ) :
					?>
					<div class="band-panel" role="tabpanel" id="panel-<?php echo esc_attr( $csamba_key ); ?>"
						aria-labelledby="tab-<?php echo esc_attr( $csamba_key ); ?>" <?php echo $csamba_first ? '' : 'hidden'; ?>>
						<?php echo wp_kses_post( $csamba_tab['content'] ); ?>
					</div>
					<?php
					$csamba_first = false;
				endforeach;
				?>
			</div>
		</article>

		<section class="grid grid-3">
			<div class="card feature-tile">
				<div class="head"><?php csamba_icon( 'photo' ); ?><h2><?php esc_html_e( 'Fotos', 'csamba' ); ?><span><?php the_title(); ?></span></h2></div>
				<p><?php esc_html_e( 'Veja o álbum de fotos que a banda separou pra você.', 'csamba' ); ?></p>
				<a class="btn" href="#panel-fotos"><?php esc_html_e( 'Veja todas as fotos', 'csamba' ); ?></a>
			</div>
			<div class="card feature-tile">
				<div class="head"><?php csamba_icon( 'radio' ); ?><h2><?php esc_html_e( 'Rádio', 'csamba' ); ?><span><?php the_title(); ?></span></h2></div>
				<p><?php esc_html_e( 'Ouça já a rádio da banda.', 'csamba' ); ?></p>
				<a class="btn" href="<?php echo esc_url( $csamba_radio ? $csamba_radio : '#panel-radio' ); ?>"><?php esc_html_e( 'Ouvir agora', 'csamba' ); ?></a>
			</div>
			<div class="card feature-tile">
				<div class="head"><?php csamba_icon( 'lyrics' ); ?><h2><?php esc_html_e( 'Letras', 'csamba' ); ?><span><?php the_title(); ?></span></h2></div>
				<p><?php esc_html_e( 'Aprenda a cantar agora as músicas da banda.', 'csamba' ); ?></p>
				<a class="btn" href="#panel-letras"><?php esc_html_e( 'Veja todas as letras', 'csamba' ); ?></a>
			</div>
		</section>

		<section class="grid grid-2">
			<div>
				<h2 class="section-title">
					<span class="kicker"><?php esc_html_e( 'Novidades', 'csamba' ); ?></span>
					<span class="main"><?php the_title(); ?></span>
				</h2>
				<div class="stack">
					<?php if ( $csamba_news ) : ?>
						<?php foreach ( $csamba_news as $csamba_item ) : ?>
							<?php get_template_part( 'template-parts/news-card', null, array( 'post_id' => $csamba_item->ID ) ); ?>
						<?php endforeach; ?>
					<?php else : ?>
						<div class="card card-pad"><p><?php esc_html_e( 'Nenhuma notícia dessa banda ainda.', 'csamba' ); ?></p></div>
					<?php endif; ?>
				</div>
			</div>

			<div class="stack">
				<?php
				get_template_part(
					'template-parts/agenda',
					null,
					array(
						'kicker'  => __( 'Agenda', 'csamba' ),
						'main'    => get_the_title(),
						'band_id' => $csamba_band_id,
					)
				);
				?>
				<?php get_template_part( 'template-parts/promo-cards' ); ?>
			</div>
		</section>
	</div>

	<?php
endwhile;

get_footer();
