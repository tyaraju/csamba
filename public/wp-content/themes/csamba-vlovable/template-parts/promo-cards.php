<?php
/**
 * Cards promocionais: cadastre-se, rádio web e podcast.
 *
 * @package CSamba
 */

?>
<div class="grid grid-3">
	<div class="card promo">
		<?php csamba_icon( 'register' ); ?>
		<h3><?php esc_html_e( 'Cadastre-se', 'csamba' ); ?></h3>
		<p><?php esc_html_e( 'Saiba como aproveitar ao máximo o portal.', 'csamba' ); ?></p>
		<a class="btn" href="<?php echo esc_url( home_url( '/cadastrar-banda/' ) ); ?>"><?php esc_html_e( 'Cadastre agora', 'csamba' ); ?></a>
	</div>

	<div class="card promo">
		<?php csamba_icon( 'radio' ); ?>
		<h3><?php esc_html_e( 'Rádio Web', 'csamba' ); ?></h3>
		<p><?php esc_html_e( 'Ouça já a rádio do portal, no ar 24 horas.', 'csamba' ); ?></p>
		<a class="btn btn-ghost" href="<?php echo esc_url( home_url( '/radio/' ) ); ?>"><?php esc_html_e( 'Ouvir agora', 'csamba' ); ?></a>
	</div>

	<div class="card promo">
		<?php csamba_icon( 'podcast' ); ?>
		<h3><?php esc_html_e( 'Podcast', 'csamba' ); ?></h3>
		<p><?php esc_html_e( 'Baixe os episódios e ouça onde quiser.', 'csamba' ); ?></p>
		<a class="btn btn-ghost" href="<?php echo esc_url( home_url( '/podcast/' ) ); ?>"><?php esc_html_e( 'Baixar episódio', 'csamba' ); ?></a>
	</div>
</div>
