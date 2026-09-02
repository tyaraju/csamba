<?php
get_header();

if (have_posts()) :
  while (have_posts()) :
    the_post();

    $post_id = get_the_ID();
    $acf = function_exists('get_field')
      && function_exists('acf_get_setting')
      && acf_get_setting('version');

    $descricao      = (string) get_post_meta($post_id, 'casa_descricao', true);
    $tipo           = (string) get_post_meta($post_id, 'casa_tipo', true);
    $endereco       = trim((string) get_post_meta($post_id, 'casa_endereco', true));
    $numero         = trim((string) get_post_meta($post_id, 'casa_numero', true));
    $complemento    = trim((string) get_post_meta($post_id, 'casa_complemento', true));
    $bairro         = trim((string) get_post_meta($post_id, 'casa_bairro', true));
    $cidade         = trim((string) get_post_meta($post_id, 'casa_cidade', true));
    $estado         = trim((string) get_post_meta($post_id, 'casa_estado', true));
    $cep            = trim((string) get_post_meta($post_id, 'casa_cep', true));
    $maps           = trim((string) get_post_meta($post_id, 'casa_maps', true));
    $telefone       = trim((string) get_post_meta($post_id, 'casa_telefone', true));
    $whatsapp       = trim((string) get_post_meta($post_id, 'casa_whatsapp', true));
    $site           = trim((string) get_post_meta($post_id, 'casa_site', true));
    $instagram      = trim((string) get_post_meta($post_id, 'casa_instagram', true));
    $facebook       = trim((string) get_post_meta($post_id, 'casa_facebook', true));
    $horarios       = trim((string) get_post_meta($post_id, 'casa_horarios', true));
    $reservas       = trim((string) get_post_meta($post_id, 'casa_reservas', true));
    $ingressos      = trim((string) get_post_meta($post_id, 'casa_ingressos', true));

    $acessibilidade = (bool) get_post_meta($post_id, 'casa_acessibilidade', true);
    $estacionamento = (bool) get_post_meta($post_id, 'casa_estacionamento', true);
    $area_externa   = (bool) get_post_meta($post_id, 'casa_area_externa', true);
    $comida         = (bool) get_post_meta($post_id, 'casa_comida', true);

    $tipo_labels = [
      'bar' => 'Bar',
      'casa_de_shows' => 'Casa de shows',
      'restaurante' => 'Restaurante',
      'clube' => 'Clube',
      'centro_cultural' => 'Centro cultural',
      'outro' => 'Outro',
    ];
    $tipo_label = $tipo_labels[$tipo] ?? '';

    $endereco_partes = array_filter([
      trim($endereco . ($numero ? ', ' . $numero : '')),
      $complemento,
      $bairro,
      trim($cidade . ($estado ? ' - ' . $estado : '')),
      $cep ? 'CEP ' . $cep : '',
    ]);
    $endereco_completo = implode(' · ', $endereco_partes);

    $gallery = [];

    for ($i = 1; $i <= 6; $i++) {
      $img_id = (int) get_post_meta(
        $post_id,
        'casa_foto_' . $i,
        true
      );

      if ($img_id) {
        $gallery[] = $img_id;
      }
    }
    $gallery = array_values(array_unique($gallery));

    $today = current_time('Ymd');
    $events = new WP_Query([
      'post_type' => 'evento',
      'post_status' => 'publish',
      'posts_per_page' => 8,
      'meta_key' => 'evento_data',
      'orderby' => 'meta_value_num',
      'order' => 'ASC',
      'meta_query' => [
        'relation' => 'AND',
        [
          'key' => 'evento_casa',
          'value' => $post_id,
          'compare' => '=',
        ],
        [
          'key' => 'evento_data',
          'value' => $today,
          'compare' => '>=',
          'type' => 'NUMERIC',
        ],
      ],
    ]);

    $whatsapp_digits = preg_replace('/\D+/', '', $whatsapp);
    if ($whatsapp_digits && strlen($whatsapp_digits) <= 11) {
      $whatsapp_digits = '55' . $whatsapp_digits;
    }
?>

<main class="single-casa">
  <section class="casa-hero">
    <div class="container">
      <div class="casa-hero-grid">
        <div class="casa-hero-media">
          <img src="<?php echo esc_url(csamba_image_url($post_id, 'csamba-hero', get_the_title())); ?>" alt="<?php echo esc_attr(get_the_title()); ?>">
        </div>

        <div class="casa-hero-copy">
          <?php if ($tipo_label): ?>
            <span class="eyebrow"><?php echo esc_html($tipo_label); ?></span>
          <?php endif; ?>

          <h1><?php the_title(); ?></h1>

          <?php if ($cidade || $bairro): ?>
            <p class="casa-location">
              <?php echo esc_html(implode(' · ', array_filter([$bairro, trim($cidade . ($estado ? ' - ' . $estado : ''))]))); ?>
            </p>
          <?php endif; ?>

          <?php if ($endereco_completo): ?>
            <p class="casa-address"><?php echo esc_html($endereco_completo); ?></p>
          <?php endif; ?>

          <div class="casa-hero-actions">
            <?php if ($maps): ?>
              <a class="button" href="<?php echo esc_url($maps); ?>" target="_blank" rel="noopener">Ver no mapa</a>
            <?php endif; ?>

            <?php if ($reservas): ?>
              <a class="button button-light" href="<?php echo esc_url($reservas); ?>" target="_blank" rel="noopener">Reservas</a>
            <?php endif; ?>
          </div>
        </div>
      </div>
    </div>
  </section>

  <div class="container casa-content-grid">
    <div class="casa-main">
      <section class="casa-section casa-about">
        <header class="section-heading ruled">
          <p>SOBRE</p>
          <h2><?php the_title(); ?></h2>
        </header>

        <div class="prose">
          <?php
          if ($descricao) {
            echo wp_kses_post($descricao);
          } else {
            the_content();
          }
          ?>
        </div>
      </section>

      <?php if ($gallery): ?>
        <section class="casa-section casa-gallery-section">
          <header class="section-heading ruled">
            <p>FOTOS</p>
            <h2>DA CASA</h2>
          </header>

          <div class="casa-gallery">
            <?php foreach ($gallery as $img_id): ?>
              <a class="casa-gallery-item" href="<?php echo esc_url(wp_get_attachment_image_url($img_id, 'full')); ?>" target="_blank" rel="noopener">
                <?php echo wp_get_attachment_image($img_id, 'csamba-card', false, ['loading' => 'lazy', 'alt' => get_the_title()]); ?>
              </a>
            <?php endforeach; ?>
          </div>
        </section>
      <?php endif; ?>

      <section class="casa-section casa-events">
        <header class="section-heading ruled">
          <p>AGENDA</p>
          <h2>PRÓXIMOS EVENTOS</h2>
        </header>

        <?php if ($events->have_posts()): ?>
          <div class="casa-events-list">
            <?php while ($events->have_posts()): $events->the_post();
              $event_id = get_the_ID();
              $date = $acf ? (string) get_field('evento_data', $event_id) : '';
              $time = $acf ? (string) get_field('evento_hora', $event_id) : '';
              $band_id = $acf ? (int) get_field('evento_banda', $event_id) : 0;
              $date_obj = $date ? DateTime::createFromFormat('Ymd', $date) : false;
            ?>
              <a class="casa-event-item" href="<?php the_permalink(); ?>">
                <span class="agenda-date">
                  <strong><?php echo $date_obj ? esc_html($date_obj->format('d')) : '--'; ?></strong>
                  <small><?php echo $date_obj ? esc_html(strtoupper(wp_date('M', $date_obj->getTimestamp()))) : 'DATA'; ?></small>
                </span>

                <span class="casa-event-copy">
                  <small><?php echo esc_html(implode(' · ', array_filter([$time, $band_id ? get_the_title($band_id) : '']))); ?></small>
                  <strong><?php the_title(); ?></strong>
                </span>

                <span class="casa-event-arrow" aria-hidden="true">→</span>
              </a>
            <?php endwhile; ?>
          </div>

          <a class="text-link" href="<?php echo esc_url(get_post_type_archive_link('evento')); ?>">Ver agenda completa</a>
        <?php else: ?>
          <p class="empty-state">Ainda não há próximos eventos cadastrados para esta casa.</p>
        <?php endif; ?>

        <?php wp_reset_postdata(); ?>
      </section>
    </div>

    <aside class="casa-sidebar">
      <?php if ($horarios): ?>
        <section class="casa-info-card">
          <h2>Funcionamento</h2>
          <p><?php echo nl2br(esc_html($horarios)); ?></p>
        </section>
      <?php endif; ?>

      <?php if ($telefone || $whatsapp || $site || $instagram || $facebook): ?>
        <section class="casa-info-card">
          <h2>Contato</h2>
          <div class="casa-contact-list">
            <?php if ($telefone): ?>
              <a href="tel:<?php echo esc_attr(preg_replace('/[^\d+]/', '', $telefone)); ?>"><?php echo esc_html($telefone); ?></a>
            <?php endif; ?>
            <?php if ($whatsapp_digits): ?>
              <a href="<?php echo esc_url('https://wa.me/' . $whatsapp_digits); ?>" target="_blank" rel="noopener">WhatsApp</a>
            <?php endif; ?>
            <?php if ($site): ?><a href="<?php echo esc_url($site); ?>" target="_blank" rel="noopener">Site oficial</a><?php endif; ?>
            <?php if ($instagram): ?><a href="<?php echo esc_url($instagram); ?>" target="_blank" rel="noopener">Instagram</a><?php endif; ?>
            <?php if ($facebook): ?><a href="<?php echo esc_url($facebook); ?>" target="_blank" rel="noopener">Facebook</a><?php endif; ?>
          </div>
        </section>
      <?php endif; ?>

      <?php if ($acessibilidade || $estacionamento || $area_externa || $comida): ?>
        <section class="casa-info-card">
          <h2>Estrutura</h2>
          <ul class="casa-features">
            <?php if ($acessibilidade): ?><li>Acessibilidade</li><?php endif; ?>
            <?php if ($estacionamento): ?><li>Estacionamento</li><?php endif; ?>
            <?php if ($area_externa): ?><li>Área externa</li><?php endif; ?>
            <?php if ($comida): ?><li>Serve comida</li><?php endif; ?>
          </ul>
        </section>
      <?php endif; ?>

      <?php if ($ingressos || $reservas): ?>
        <section class="casa-info-card casa-info-actions">
          <?php if ($ingressos): ?>
            <a class="button" href="<?php echo esc_url($ingressos); ?>" target="_blank" rel="noopener">Programação / ingressos</a>
          <?php endif; ?>
          <?php if ($reservas): ?>
            <a class="button button-light" href="<?php echo esc_url($reservas); ?>" target="_blank" rel="noopener">Fazer reserva</a>
          <?php endif; ?>
        </section>
      <?php endif; ?>
    </aside>
  </div>
</main>

<?php
  endwhile;
endif;

get_footer();
