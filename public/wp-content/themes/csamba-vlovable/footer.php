<?php
/**
 * Rodapé.
 *
 * @package CSamba
 */

?>
</main>

<footer class="site-footer">
	<div class="container footer-inner">
		<?php csamba_logo_mark( 34 ); ?>
		<span>
			<?php
			printf(
				/* translators: %s: nome do site */
				esc_html__( '© %s. Todos os direitos reservados.', 'csamba' ),
				esc_html( get_bloginfo( 'name' ) )
			);
			?>
		</span>
	</div>
</footer>

<?php wp_footer(); ?>
</body>
</html>
