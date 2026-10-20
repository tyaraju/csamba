<?php
get_header();

if (!have_posts()) {
  get_footer();
  return;
}

the_post();

$house_id = get_the_ID();
$house_title = get_the_title();

/* =========================
   HELPERS
   ========================= */

$meta = static function ($id, $key) {
  $value = get_post_meta($id, $key, true);

  return is_scalar($value) ? trim((string) $value) : '';
};

$casa_icon = static function ($name) {
  $paths = [
    'home' => '
      <path d="m3 10 9-7 9 7"/>
      <path d="M5 9v12h14V9M9 21v-8h6v8"/>
    ',
    'pin' => '
      <path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 1 1 16 0Z"/>
      <circle cx="12" cy="10" r="2.5"/>
    ',
    'map' => '
      <path d="m3 6 6-3 6 3 6-3v15l-6 3-6-3-6 3ZM9 3v15M15 6v15"/>
    ',
    'chat' => '
      <path d="M4 4h16v12H9l-5 4Z"/>
      <path
        d="M8 10h.01M12 10h.01M16 10h.01"
        stroke-width="3"
        stroke-linecap="round"
      />
    ',
    'instagram' => '
      <rect x="3" y="3" width="18" height="18" rx="5"/>
      <circle cx="12" cy="12" r="4"/>
      <circle cx="17.5" cy="6.5" r=".8"
        fill="currentColor" stroke="none"/>
    ',
    'site' => '
      <path d="M14 3h7v7M21 3 10 14"/>
      <path d="M10 5H5a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-5"/>
    ',
    'clock' => '
      <circle cx="12" cy="12" r="9"/>
      <path d="M12 7v5l3 2"/>
    ',
    'check' => '
      <path d="m5 12 4 4L19 6"/>
    ',
  ];

  if (!isset($paths[$name])) {
    return '';
  }

  return '<svg
    class="casa-icon"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="1.8"
    stroke-linecap="round"
    stroke-linejoin="round"
    aria-hidden="true">'
    . $paths[$name]
    . '</svg>';
};

/* =========================
   CAMPOS
   ========================= */

$descricao   = $meta($house_id, 'casa_descricao');
$tipo        = $meta($house_id, 'casa_tipo');
$endereco    = $meta($house_id, 'casa_endereco');
$numero      = $meta($house_id, 'casa_numero');
$complemento = $meta($house_id, 'casa_complemento');
$bairro      = $meta($house_id, 'casa_bairro');
$cidade      = $meta($house_id, 'casa_cidade');
$estado      = $meta($house_id, 'casa_estado');
$cep         = $meta($house_id, 'casa_cep');

$maps      = esc_url($meta($house_id, 'casa_maps'));
$telefone  = $meta($house_id, 'casa_telefone');
$whatsapp  = $meta($house_id, 'casa_whatsapp');
$site      = esc_url($meta($house_id, 'casa_site'));
$instagram = esc_url($meta($house_id, 'casa_instagram'));
$facebook  = esc_url($meta($house_id, 'casa_facebook'));

$horarios  = $meta($house_id, 'casa_horarios');
$reservas  = esc_url($meta($house_id, 'casa_reservas'));
$ingressos = esc_url($meta($house_id, 'casa_ingressos'));

$tipo_labels = [
  'bar'             => 'Bar',
  'casa_de_shows'   => 'Casa de shows',
  'restaurante'     => 'Restaurante',
  'clube'           => 'Clube',
  'centro_cultural' => 'Centro cultural',
  'outro'           => 'Outro',
];

$tipo_label = $tipo_labels[$tipo] ?? '';

/* =========================
   ENDEREÇO E MAPA
   ========================= */

$city_state = implode(' / ', array_filter([$cidade, $estado]));

$location = implode(' · ', array_filter([
  $bairro,
  $city_state,
]));

$street = implode(', ', array_filter([
  $endereco,
  $numero,
]));

$full_address = implode(' · ', array_filter([
  $street,
  $complemento,
  $bairro,
  $city_state,
  $cep ? 'CEP ' . $cep : '',
]));

$has_location = $full_address !== '' || $maps !== '';

$map_query = implode(', ', array_filter([
  $street,
  $bairro,
  $cidade,
  $estado,
  $cep,
  'Brasil',
]));

$map_embed_url = ($endereco && $cidade)
  ? 'https://maps.google.com/maps?q='
    . rawurlencode($map_query)
    . '&z=16&output=embed'
  : '';

$maps_url = $maps;

if (!$maps_url && ($endereco || $cidade)) {
  $maps_url = 'https://www.google.com/maps/search/?api=1&query='
    . rawurlencode($map_query);
}

/* =========================
   CONTATOS
   ========================= */

$whatsapp_digits = preg_replace('/\D+/', '', $whatsapp);

if (in_array(strlen($whatsapp_digits), [10, 11], true)) {
  $whatsapp_digits = '55' . $whatsapp_digits;
}

$whatsapp_url = $whatsapp_digits
  ? 'https://wa.me/' . $whatsapp_digits
  : '';

$phone_digits = preg_replace('/[^\d+]/', '', $telefone);

$visit_contact_url = $whatsapp_url
  ?: ($reservas ?: ($instagram ?: ($site ?: $facebook)));

$has_contact = $telefone || $whatsapp_url
  || $site || $instagram || $facebook;

/* =========================
   FORMULÁRIO
   ========================= */

$form_enabled = $meta($house_id, 'casa_form_ativo') === '1'
  && is_email($meta($house_id, 'casa_email_contato'));

$form_status = isset($_GET['contato_casa'])
  && is_string($_GET['contato_casa'])
    ? sanitize_key(wp_unslash($_GET['contato_casa']))
    : '';

$form_feedback = [
  'enviado' =>
    'Sua mensagem foi encaminhada! A casa responderá pelo contato informado.',
  'dados' =>
    'Confira os campos obrigatórios, a data e a quantidade de pessoas. Preencha o formulário novamente.',
  'sessao' =>
    'A sessão do formulário expirou. Atualize a página e tente novamente.',
  'limite' =>
    'Você atingiu o limite de tentativas. Aguarde 15 minutos antes de tentar novamente.',
  'indisponivel' =>
    'O formulário está indisponível. Use os canais oficiais da casa.',
  'erro' =>
    'Não foi possível encaminhar a mensagem. Tente novamente ou use os canais oficiais da casa.',
];

/* =========================
   ESTRUTURA E DESCRIÇÃO
   ========================= */

$features = [];

foreach ([
  'casa_acessibilidade' => 'Acessibilidade',
  'casa_estacionamento' => 'Estacionamento',
  'casa_area_externa'   => 'Área externa',
  'casa_comida'         => 'Serve comida',
] as $key => $label) {
  if ($meta($house_id, $key) === '1') {
    $features[] = $label;
  }
}

$description_html = $descricao
  ? wpautop(wp_kses_post($descricao))
  : apply_filters('the_content', get_the_content());

$has_description = trim(wp_strip_all_tags($description_html)) !== '';

$intro = has_excerpt()
  ? get_the_excerpt()
  : wp_trim_words(
      wp_strip_all_tags(
        strip_shortcodes($descricao ?: get_the_content())
      ),
      18
    );

/* =========================
   GALERIA
   ========================= */

$gallery = [];

for ($i = 1; $i <= 6; $i++) {
  $image_id = (int) $meta($house_id, 'casa_foto_' . $i);

  if ($image_id && wp_attachment_is_image($image_id)) {
    $gallery[] = $image_id;
  }
}

$gallery = array_values(array_unique($gallery));

/* =========================
   EVENTOS
   ========================= */

$events = new WP_Query([
  'post_type'      => 'evento',
  'post_status'    => 'publish',
  'posts_per_page' => 9,
  'no_found_rows'  => true,
  'meta_key'       => 'evento_data',
  'orderby'        => 'meta_value_num',
  'order'          => 'ASC',
  'meta_query'     => [
    'relation' => 'AND',
    [
      'relation' => 'OR',
      [
        'key'     => 'evento_casa',
        'value'   => (string) $house_id,
        'compare' => '=',
      ],
      [
        'key'     => 'evento_casa',
        'value'   => '"' . $house_id . '"',
        'compare' => 'LIKE',
      ],
    ],
    [
      'key'     => 'evento_data',
      'value'   => current_time('Ymd'),
      'compare' => '>=',
      'type'    => 'NUMERIC',
    ],
  ],
]);

/* =========================
   OUTRAS CASAS
   ========================= */

$related = get_posts([
  'post_type'      => 'casa',
  'post_status'    => 'publish',
  'posts_per_page' => 3,
  'post__not_in'   => [$house_id],
  'orderby'        => 'title',
  'order'          => 'ASC',
]);

$houses_archive = get_post_type_archive_link('casa');
$events_archive = get_post_type_archive_link('evento');
?>

<main class="single-casa single-casa--contact">
  <div class="container casa-page">

    <!-- Breadcrumb -->
    <nav class="casa-breadcrumb" aria-label="Navegação estrutural">
      <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>

      <span aria-hidden="true">›</span>

      <?php if ($houses_archive): ?>
        <a href="<?php echo esc_url($houses_archive); ?>">
          Casas de samba
        </a>
        <span aria-hidden="true">›</span>
      <?php endif; ?>

      <span aria-current="page">
        <?php echo esc_html($house_title); ?>
      </span>
    </nav>

    <!-- Hero -->
    <section class="casa-hero" aria-labelledby="casa-title">
      <div class="casa-hero-media">
        <img
          src="<?php echo esc_url(csamba_image_url(
            $house_id,
            'csamba-hero',
            $house_title
          )); ?>"
          alt="<?php echo esc_attr($house_title); ?>"
          fetchpriority="high"
          decoding="async"
        >
      </div>

      <div class="casa-hero-copy">
        <div class="casa-hero-labels">
          <span class="casa-eyebrow">
            <?php echo $casa_icon('home'); ?>
            Casas de samba
          </span>

          <?php if ($tipo_label): ?>
            <span class="casa-type">
              <?php echo esc_html($tipo_label); ?>
            </span>
          <?php endif; ?>
        </div>

        <h1 id="casa-title">
          <?php echo esc_html($house_title); ?>
        </h1>

        <?php if ($location): ?>
          <p class="casa-location">
            <?php echo $casa_icon('pin'); ?>
            <span><?php echo esc_html($location); ?></span>
          </p>
        <?php endif; ?>

        <?php if ($intro): ?>
          <p class="casa-hero-address">
            <?php echo esc_html($intro); ?>
          </p>
        <?php endif; ?>

        <div class="casa-hero-actions">
          <a class="casa-button" href="#casa-agenda">
            Ver programação
            <span aria-hidden="true">↓</span>
          </a>

          <?php if ($form_enabled): ?>
            <a
              class="casa-button casa-button--outline"
              href="#casa-contato"
            >
              Falar com a casa
              <span aria-hidden="true">↓</span>
            </a>
          <?php elseif ($visit_contact_url): ?>
            <a
              class="casa-button casa-button--outline"
              href="<?php echo esc_url($visit_contact_url); ?>"
              target="_blank"
              rel="noopener noreferrer"
            >
              Falar com a casa
              <span aria-hidden="true">↗</span>
            </a>
          <?php elseif ($has_location): ?>
            <a
              class="casa-button casa-button--outline"
              href="#casa-localizacao"
            >
              Como chegar
              <span aria-hidden="true">↓</span>
            </a>
          <?php endif; ?>
        </div>

        <?php if ($has_contact): ?>
          <nav
            class="casa-hero-networks"
            aria-label="Contato e canais oficiais da casa"
          >
            <?php if ($telefone && $phone_digits): ?>
              <a href="<?php echo esc_attr('tel:' . $phone_digits); ?>">
                <?php echo $casa_icon('chat'); ?>
                <span><?php echo esc_html($telefone); ?></span>
              </a>
            <?php endif; ?>

            <?php
            $hero_contacts = [
              ['WhatsApp', $whatsapp_url, 'chat'],
              ['Instagram', $instagram, 'instagram'],
              ['Facebook', $facebook, 'site'],
              ['Site', $site, 'site'],
            ];

            foreach ($hero_contacts as [$label, $url, $icon]):
              if (!$url) {
                continue;
              }
              ?>
              <a
                href="<?php echo esc_url($url); ?>"
                target="_blank"
                rel="noopener noreferrer"
                aria-label="<?php echo esc_attr(
                  $label . ' da casa (abre em nova aba)'
                ); ?>"
              >
                <?php echo $casa_icon($icon); ?>
                <span><?php echo esc_html($label); ?></span>
              </a>
            <?php endforeach; ?>
          </nav>
        <?php endif; ?>
      </div>
    </section>

    <!-- Navegação -->
    <nav class="casa-section-nav" aria-label="Nesta página">
      <a href="#casa-visao-geral" aria-current="location">
        Visão geral
      </a>

      <a href="#casa-agenda">Programação</a>

      <?php if ($gallery): ?>
        <a href="#casa-fotos">Fotos</a>
      <?php endif; ?>

      <?php if ($has_location): ?>
        <a href="#casa-localizacao">Localização</a>
      <?php endif; ?>

      <?php if ($form_enabled): ?>
        <a href="#casa-contato">Fale com a casa</a>
      <?php endif; ?>
    </nav>

    <!-- Visão geral -->
    <div class="casa-overview" id="casa-visao-geral">
      <section class="casa-overview-section" id="casa-sobre">
        <header class="casa-section-heading">
          <h2>Sobre a casa</h2>
        </header>

        <div class="casa-overview-panel casa-prose">
          <?php if ($has_description): ?>
            <?php echo wp_kses_post($description_html); ?>
          <?php else: ?>
            <p>Em breve, mais informações sobre esta casa.</p>
          <?php endif; ?>
        </div>
      </section>

      <aside class="casa-overview-section" aria-label="Informações da visita">
        <header class="casa-section-heading">
          <h2>Planeje sua visita</h2>
        </header>

        <div class="casa-overview-panel">
          <dl class="casa-visit-list">
            <?php if ($bairro): ?>
              <div>
                <?php echo $casa_icon('pin'); ?>
                <div>
                  <dt>Bairro</dt>
                  <dd><?php echo esc_html($bairro); ?></dd>
                </div>
              </div>
            <?php endif; ?>

            <?php if ($city_state): ?>
              <div>
                <?php echo $casa_icon('map'); ?>
                <div>
                  <dt>Cidade</dt>
                  <dd><?php echo esc_html($city_state); ?></dd>
                </div>
              </div>
            <?php endif; ?>

            <?php if ($horarios): ?>
              <div>
                <?php echo $casa_icon('clock'); ?>
                <div>
                  <dt>Funcionamento</dt>
                  <dd><?php echo nl2br(esc_html($horarios)); ?></dd>
                </div>
              </div>
            <?php endif; ?>
          </dl>

          <?php if (!$bairro && !$city_state && !$horarios): ?>
            <p class="casa-visit-note">
              Consulte os detalhes da visita nos canais oficiais da casa.
            </p>
          <?php endif; ?>

          <?php if ($features): ?>
            <ul class="casa-features">
              <?php foreach ($features as $feature): ?>
                <li>
                  <span aria-hidden="true">✓</span>
                  <?php echo esc_html($feature); ?>
                </li>
              <?php endforeach; ?>
            </ul>
          <?php endif; ?>

          <?php if ($reservas || $ingressos): ?>
            <div class="casa-visit-actions">
              <?php if ($reservas): ?>
                <a
                  class="casa-text-link"
                  href="<?php echo esc_url($reservas); ?>"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  Reservas
                  <span aria-hidden="true">↗</span>
                </a>
              <?php endif; ?>

              <?php if ($ingressos): ?>
                <a
                  class="casa-text-link"
                  href="<?php echo esc_url($ingressos); ?>"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  Ingressos
                  <span aria-hidden="true">↗</span>
                </a>
              <?php endif; ?>
            </div>
          <?php endif; ?>
        </div>
      </aside>
    </div>

    <!-- Programação -->
    <section class="casa-section" id="casa-agenda">
      <header class="casa-section-heading casa-section-heading--row">
        <h2>O próximo samba é aqui</h2>

        <?php if ($events_archive): ?>
          <a class="casa-text-link" href="<?php echo esc_url($events_archive); ?>">
            Agenda completa <span aria-hidden="true">↗</span>
          </a>
        <?php endif; ?>
      </header>

      <?php if ($events->posts): ?>
        <div class="casa-events-list">
          <?php foreach ($events->posts as $event):
            $event_id = $event->ID;
            $raw_date = $meta($event_id, 'evento_data');
            $time = $meta($event_id, 'evento_hora');

            $date = DateTimeImmutable::createFromFormat(
              '!Ymd',
              $raw_date,
              wp_timezone()
            );

            $valid_date = $date
              && $date->format('Ymd') === $raw_date;

            if (preg_match('/^\d{2}:\d{2}(?::\d{2})?$/', $time)) {
              $time = substr($time, 0, 5);
            }

            $band_value = get_post_meta($event_id, 'evento_banda', true);
            $band_ids = is_array($band_value) ? $band_value : [$band_value];
            $band_names = [];

            foreach ($band_ids as $band_id) {
              if (is_numeric($band_id) && (int) $band_id > 0) {
                $name = get_the_title((int) $band_id);

                if ($name) {
                  $band_names[] = $name;
                }
              }
            }

            $has_event_image = has_post_thumbnail($event_id);
            ?>

            <article class="casa-program-card">
              <a href="<?php echo esc_url(get_permalink($event_id)); ?>">
                <div class="casa-program-card__top">
                  <span class="casa-program-card__date" aria-hidden="true">
                    <?php if ($valid_date): ?>
                      <small><?php echo esc_html(wp_date(
                        'D',
                        $date->getTimestamp(),
                        wp_timezone()
                      )); ?></small>

                      <strong><?php echo esc_html($date->format('d')); ?></strong>

                      <small><?php echo esc_html(wp_date(
                        'M',
                        $date->getTimestamp(),
                        wp_timezone()
                      )); ?></small>
                    <?php else: ?>
                      <strong>—</strong>
                    <?php endif; ?>
                  </span>

                  <div class="casa-program-card__image">
                    <img
                      src="<?php echo esc_url(csamba_image_url(
                        $has_event_image ? $event_id : $house_id,
                        'medium_large',
                        get_the_title($event_id)
                      )); ?>"
                      alt=""
                      loading="lazy"
                      decoding="async"
                    >
                  </div>
                </div>

                <div class="casa-program-card__body">
                  <h3><?php echo esc_html(get_the_title($event_id)); ?></h3>

                  <?php if ($band_names): ?>
                    <p><?php echo esc_html(
                      implode(', ', array_unique($band_names))
                    ); ?></p>
                  <?php endif; ?>

                  <div class="casa-program-card__details">
                    <?php if ($time): ?>
                      <span>
                        <?php echo $casa_icon('clock'); ?>
                        <?php echo esc_html($time); ?>
                      </span>
                    <?php endif; ?>

                    <?php if ($valid_date): ?>
                      <time datetime="<?php echo esc_attr($date->format('Y-m-d')); ?>">
                        <?php echo esc_html($date->format('d/m/Y')); ?>
                      </time>
                    <?php endif; ?>
                  </div>
                </div>
              </a>
            </article>

          <?php endforeach; ?>
        </div>
      <?php else: ?>
        <div class="casa-empty">
          <h3>Novas datas vêm por aí.</h3>
          <p>
            Ainda não há próximos eventos cadastrados para esta casa.
            Volte em breve para conferir a programação.
          </p>
        </div>
      <?php endif; ?>
    </section>

    <!-- Fotos -->
    <?php if ($gallery): ?>
      <section class="casa-section" id="casa-fotos">
        <header class="casa-section-heading">
          <h2>Conheça o espaço</h2>
        </header>

        <div class="casa-gallery">
          <?php foreach ($gallery as $index => $image_id):
            $full = wp_get_attachment_image_url($image_id, 'full');

            if (!$full) {
              continue;
            }

            $caption = wp_get_attachment_caption($image_id);
            ?>
            <a
              class="casa-gallery-item"
              href="<?php echo esc_url($full); ?>"
              data-casa-photo
              data-caption="<?php echo esc_attr(
                $caption ?: $house_title . ' · Foto ' . ($index + 1)
              ); ?>"
              aria-label="<?php echo esc_attr(
                'Ampliar foto ' . ($index + 1) . ' de ' . $house_title
              ); ?>"
            >
              <?php echo wp_get_attachment_image(
                $image_id,
                'medium_large',
                false,
                ['loading' => 'lazy', 'decoding' => 'async']
              ); ?>
              <span class="casa-gallery-zoom" aria-hidden="true">↗</span>
            </a>
          <?php endforeach; ?>
        </div>
      </section>
    <?php endif; ?>

    <!-- Mapa -->
    <?php if ($has_location): ?>
      <section class="casa-section" id="casa-localizacao">
        <header class="casa-section-heading">
          <h2>Encontre seu caminho</h2>
        </header>

        <div class="casa-map-card<?php
          echo !$map_embed_url ? ' casa-map-card--no-map' : '';
        ?>">
          <?php if ($map_embed_url): ?>
            <div class="casa-map-frame">
              <iframe
                src="<?php echo esc_url($map_embed_url); ?>"
                title="<?php echo esc_attr('Localização de ' . $house_title); ?>"
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
                allowfullscreen
              ></iframe>
            </div>
          <?php endif; ?>

          <div class="casa-map-copy">
            <h3><?php echo esc_html($house_title); ?></h3>

            <?php if ($location): ?>
              <p class="casa-location">
                <?php echo $casa_icon('pin'); ?>
                <span><?php echo esc_html($location); ?></span>
              </p>
            <?php endif; ?>

            <?php if ($full_address): ?>
              <address><?php echo esc_html($full_address); ?></address>
            <?php endif; ?>

            <?php if ($maps_url): ?>
              <a
                class="casa-button"
                href="<?php echo esc_url($maps_url); ?>"
                target="_blank"
                rel="noopener noreferrer"
              >
                Abrir no Google Maps
                <span aria-hidden="true">↗</span>
              </a>
            <?php endif; ?>
          </div>
        </div>
      </section>
    <?php endif; ?>

    <!-- Formulário -->
    <?php if ($form_enabled): ?>
      <section class="casa-section" id="casa-contato">
        <header class="casa-section-heading">
          <h2>Fale com a casa</h2>
        </header>

        <div class="casa-contact-card">
          <div class="casa-contact-card__intro">
            <?php echo $casa_icon('chat'); ?>

            <h3>Combine sua próxima visita</h3>

            <p>
              Tire dúvidas, consulte reservas ou planeje
              seu evento com a casa.
            </p>

            <ul>
              <li>
                <?php echo $casa_icon('check'); ?>
                Contato direto com o espaço
              </li>
              <li>
                <?php echo $casa_icon('check'); ?>
                Resposta pelos canais informados
              </li>
            </ul>

            <?php if ($whatsapp_url): ?>
              <a
                class="casa-button casa-button--outline"
                href="<?php echo esc_url($whatsapp_url); ?>"
                target="_blank"
                rel="noopener noreferrer"
              >
                Prefere WhatsApp?
                <span aria-hidden="true">↗</span>
              </a>
            <?php endif; ?>
          </div>

          <div class="casa-contact-card__body">
            <?php if (isset($form_feedback[$form_status])): ?>
              <div
                class="casa-form-feedback<?php
                  echo $form_status === 'enviado'
                    ? ' casa-form-feedback--success'
                    : '';
                ?>"
                role="<?php echo $form_status === 'enviado'
                  ? 'status'
                  : 'alert'; ?>"
              >
                <?php echo esc_html($form_feedback[$form_status]); ?>
              </div>
            <?php endif; ?>

            <form
              class="casa-contact-form"
              method="post"
              action="<?php echo esc_url(admin_url('admin-post.php')); ?>"
            >
              <input type="hidden" name="action" value="csamba_house_contact">
              <input
                type="hidden"
                name="house_id"
                value="<?php echo esc_attr($house_id); ?>"
              >

              <?php wp_nonce_field(
                'csamba_house_contact_' . $house_id,
                'house_nonce',
                false
              ); ?>

              <div class="casa-form-trap" aria-hidden="true" inert>
                <label for="house-website">Não preencha este campo</label>
                <input
                  id="house-website"
                  name="house_website"
                  type="text"
                  tabindex="-1"
                  autocomplete="off"
                >
              </div>

              <div class="casa-form-grid">
                <div class="casa-form-field">
                  <label for="house-name">Seu nome *</label>
                  <input
                    id="house-name"
                    name="house_name"
                    type="text"
                    autocomplete="name"
                    maxlength="100"
                    placeholder="Digite seu nome"
                    required
                  >
                </div>

                <div class="casa-form-field">
                  <label for="house-email">E-mail *</label>
                  <input
                    id="house-email"
                    name="house_email"
                    type="email"
                    autocomplete="email"
                    maxlength="254"
                    placeholder="seu@email.com"
                    required
                  >
                </div>

                <div class="casa-form-field">
                  <label for="house-phone">WhatsApp *</label>
                  <input
                    id="house-phone"
                    name="house_phone"
                    type="tel"
                    autocomplete="tel"
                    maxlength="40"
                    placeholder="(51) 99999-9999"
                    required
                  >
                </div>

                <div class="casa-form-field">
                  <label for="house-subject">Assunto *</label>
                  <select id="house-subject" name="house_subject" required>
                    <option value="">Selecione uma opção</option>
                    <option value="duvida">Dúvida sobre a casa</option>
                    <option value="reserva">Consulta de reserva</option>
                    <option value="evento">Evento particular / corporativo</option>
                    <option value="programacao">Programação e ingressos</option>
                    <option value="outro">Outro assunto</option>
                  </select>
                </div>

                <div class="casa-form-field">
                  <label for="house-date">Data da visita (opcional)</label>
                  <input
                    id="house-date"
                    name="house_date"
                    type="date"
                    min="<?php echo esc_attr(current_time('Y-m-d')); ?>"
                  >
                </div>

                <div class="casa-form-field">
                  <label for="house-people">
                    Quantidade de pessoas (opcional)
                  </label>
                  <input
                    id="house-people"
                    name="house_people"
                    type="number"
                    min="1"
                    max="10000"
                    step="1"
                    placeholder="Ex.: 4"
                  >
                </div>

                <div class="casa-form-field casa-form-field--full">
                  <label for="house-message">Como podemos ajudar? *</label>
                  <textarea
                    id="house-message"
                    name="house_message"
                    rows="4"
                    maxlength="2000"
                    placeholder="Escreva sua mensagem aqui..."
                    required
                  ></textarea>
                </div>
              </div>

              <label class="casa-form-consent">
                <input
                  type="checkbox"
                  name="house_consent"
                  value="1"
                  required
                >
                <span>
                  Autorizo o envio dos meus dados à casa
                  para responder à mensagem.
                </span>
              </label>

              <div class="casa-form-footer">
                <p>
                  Pedidos de reserva dependem de confirmação da casa.
                </p>
                <button class="casa-button" type="submit">
                  Enviar mensagem
                </button>
              </div>
            </form>
          </div>
        </div>
      </section>
    <?php endif; ?>

    <!-- Outras casas -->
    <?php if ($related): ?>
      <section class="casa-section">
        <header class="casa-section-heading casa-section-heading--row">
          <h2>Outras casas para conhecer</h2>

          <?php if ($houses_archive): ?>
            <a class="casa-text-link" href="<?php echo esc_url($houses_archive); ?>">
              Ver mais casas <span aria-hidden="true">→</span>
            </a>
          <?php endif; ?>
        </header>

        <div class="casa-related">
          <?php foreach ($related as $house):
            $title = get_the_title($house);
            $place = implode(' · ', array_filter([
              $meta($house->ID, 'casa_bairro'),
              implode(' / ', array_filter([
                $meta($house->ID, 'casa_cidade'),
                $meta($house->ID, 'casa_estado'),
              ])),
            ]));
            ?>
            <article>
              <a href="<?php echo esc_url(get_permalink($house)); ?>">
                <div class="casa-related__image">
                  <img
                    src="<?php echo esc_url(csamba_image_url(
                      $house->ID,
                      'medium_large',
                      $title
                    )); ?>"
                    alt=""
                    loading="lazy"
                    decoding="async"
                  >
                </div>

                <div class="casa-related__copy">
                  <h3><?php echo esc_html($title); ?></h3>

                  <?php if ($place): ?>
                    <p>
                      <?php echo $casa_icon('pin'); ?>
                      <?php echo esc_html($place); ?>
                    </p>
                  <?php endif; ?>
                </div>
              </a>
            </article>
          <?php endforeach; ?>
        </div>
      </section>
    <?php endif; ?>

  </div>

  <!-- Modal -->
  <?php if ($gallery): ?>
    <dialog class="casa-lightbox" aria-label="Fotos da casa">
      <div class="casa-lightbox-toolbar">
        <span data-casa-photo-count aria-live="polite"></span>

        <button
          class="casa-lightbox-close"
          type="button"
          data-casa-photo-close
          aria-label="Fechar galeria"
          autofocus
        >×</button>
      </div>

      <div class="casa-lightbox-stage">
        <button
          class="casa-lightbox-arrow"
          type="button"
          data-casa-photo-prev
          aria-label="Foto anterior"
        >←</button>

        <figure>
          <img data-casa-photo-image alt="">
          <figcaption data-casa-photo-caption></figcaption>
        </figure>

        <button
          class="casa-lightbox-arrow"
          type="button"
          data-casa-photo-next
          aria-label="Próxima foto"
        >→</button>
      </div>
    </dialog>
  <?php endif; ?>
</main>

<?php get_footer(); ?>