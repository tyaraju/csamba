<?php
/**
 * Bloco de agenda agrupado por dia da semana.
 *
 * @package CSamba
 */

$csamba_kicker  = isset( $args['kicker'] ) ? $args['kicker'] : __( 'Agenda', 'csamba' );
$csamba_main    = isset( $args['main'] ) ? $args['main'] : get_bloginfo( 'name' );
$csamba_band_id = isset( $args['band_id'] ) ? (int) $args['band_id'] : null;
$csamba_agenda  = csamba_agenda_by_weekday( 15, $csamba_band_id );
?>
<section>
	<h2 class="section-title">
		<span class="kicker"><?php echo esc_html( $csamba_kicker ); ?></span>
		<span class="main"><?php echo esc_html( $csamba_main ); ?></span>
	</h2>

	<div class="card card-pad">
		<?php if ( empty( $csamba_agenda ) ) : ?>
			<p><?php esc_html_e( 'Nenhum evento agendado no momento.', 'csamba' ); ?></p>
		<?php else : ?>
			<?php foreach ( $csamba_agenda as $csamba_day => $csamba_events ) : ?>
				<div class="agenda-day">
					<div class="agenda-label"><?php echo esc_html( $csamba_day ); ?></div>
					<div class="agenda-list">
						<?php
						foreach ( $csamba_events as $csamba_event ) :
							$csamba_house_id = (int) get_post_meta( $csamba_event->ID, 'csamba_event_house', true );
							$csamba_time     = get_post_meta( $csamba_event->ID, 'csamba_event_time', true );
							?>
							<div class="agenda-row">
								<?php if ( $csamba_house_id ) : ?>
									<a class="agenda-venue" href="<?php echo esc_url( get_permalink( $csamba_house_id ) ); ?>"><?php echo esc_html( get_the_title( $csamba_house_id ) ); ?></a>
								<?php else : ?>
									<span class="agenda-venue"><?php esc_html_e( 'CSamba', 'csamba' ); ?></span>
								<?php endif; ?>
								<span>
									<a href="<?php echo esc_url( get_permalink( $csamba_event->ID ) ); ?>"><?php echo esc_html( get_the_title( $csamba_event->ID ) ); ?></a>
									<?php if ( $csamba_time ) : ?>
										<em>— <?php echo esc_html( $csamba_time ); ?></em>
									<?php endif; ?>
								</span>
							</div>
						<?php endforeach; ?>
					</div>
				</div>
			<?php endforeach; ?>
		<?php endif; ?>
	</div>

	<?php if ( get_post_type_archive_link( 'evento' ) ) : ?>
		<p style="margin-top:14px;">
			<a class="btn" href="<?php echo esc_url( get_post_type_archive_link( 'evento' ) ); ?>"><?php esc_html_e( 'Veja toda a agenda', 'csamba' ); ?></a>
		</p>
	<?php endif; ?>
</section>
