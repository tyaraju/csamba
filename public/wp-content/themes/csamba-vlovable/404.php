<?php
/**
 * Página 404.
 *
 * @package CSamba
 */

get_header();
?>
<div class="container">
	<div class="card page-hero" style="flex-direction:column;align-items:flex-start;">
		<h1><?php esc_html_e( 'Página não encontrada', 'csamba' ); ?></h1>
		<p><?php esc_html_e( 'O conteúdo que você procura saiu de cartaz. Volte para a home ou busque uma banda.', 'csamba' ); ?></p>
		<p><a class="btn" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php esc_html_e( 'Ir para a home', 'csamba' ); ?></a></p>
	</div>
</div>
<?php
get_footer();
