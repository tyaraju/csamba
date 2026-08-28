<?php
/**
 * Archive de bandas — destaque + listagem A a Z.
 *
 * @package CSamba
 */

get_header();

$csamba_featured = csamba_featured_posts( 'banda', 1 );
$csamba_featured = ! empty( $csamba_featured[0] ) ? $csamba_featured[0] : null;

$csamba_groups = array();
if ( have_posts() ) {
	while ( have_posts() ) {
		the_post();
		$csamba_letter = strtoupper( remove_accents( mb_substr( get_the_title(), 0, 1 ) ) );
		if ( ! preg_match( '/[A-Z]/', $csamba_letter ) ) {
			$csamba_letter = '#';
		}
		$csamba_groups[ $csamba_letter ][] = array(
			'title' => get_the_title(),
			'url'   => get_permalink(),
		);
	}
	wp_reset_postdata();
}
ksort( $csamba_groups );
?>

<div class="container stack">
	<?php csamba_breadcrumb( array( __( 'bandas', 'csamba' ) => null ) ); ?>

	<header class="card page-hero">
		<h1><?php esc_html_e( 'Bandas', 'csamba' ); ?></h1>
		<p><?php esc_html_e( 'Todas as bandas de samba e pagode cadastradas no portal, de A a Z.', 'csamba' ); ?></p>
	</header>

	<?php if ( $csamba_featured ) : ?>
		<section>
			<h2 class="section-title"><span class="main"><?php esc_html_e( 'Em destaque', 'csamba' ); ?></span></h2>
			<div class="card card-pad featured-band">
				<a href="<?php echo esc_url( get_permalink( $csamba_featured->ID ) ); ?>"><?php csamba_thumbnail( $csamba_featured->ID, 'csamba-hero' ); ?></a>
				<div>
					<?php csamba_band_title( $csamba_featured->ID ); ?>
					<p><?php echo esc_html( wp_trim_words( get_the_excerpt( $csamba_featured->ID ), 46 ) ); ?></p>
					<a href="<?php echo esc_url( get_permalink( $csamba_featured->ID ) ); ?>"><em><?php esc_html_e( 'clique aqui', 'csamba' ); ?></em></a>
				</div>
			</div>
		</section>
	<?php endif; ?>

	<section>
		<div class="az-toolbar">
			<h2 class="section-title" style="margin:0;"><span class="main"><?php esc_html_e( 'Bandas de A a Z', 'csamba' ); ?></span></h2>
			<label class="screen-reader-text" for="az-filter"><?php esc_html_e( 'Buscar banda', 'csamba' ); ?></label>
			<input id="az-filter" type="search" data-az-filter placeholder="<?php esc_attr_e( 'buscar banda', 'csamba' ); ?>" style="margin-left:auto;" />
		</div>

		<?php if ( empty( $csamba_groups ) ) : ?>
			<div class="card card-pad"><p><?php esc_html_e( 'Nenhuma banda cadastrada ainda.', 'csamba' ); ?></p></div>
		<?php else : ?>
			<div class="card card-pad">
				<div class="az-grid">
					<?php foreach ( $csamba_groups as $csamba_letter => $csamba_items ) : ?>
						<div class="az-group">
							<p class="az-letter"><?php echo esc_html( $csamba_letter ); ?></p>
							<ul>
								<?php foreach ( $csamba_items as $csamba_item ) : ?>
									<li><a href="<?php echo esc_url( $csamba_item['url'] ); ?>"><?php echo esc_html( $csamba_item['title'] ); ?></a></li>
								<?php endforeach; ?>
							</ul>
						</div>
					<?php endforeach; ?>
				</div>
			</div>
		<?php endif; ?>
	</section>
</div>

<?php
get_footer();
