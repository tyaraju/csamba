<?php
get_header();

if (!have_posts()) {
  get_footer();
  return;
}

the_post();

$band_id = get_the_ID();
$band_title = get_the_title();

/* =========================
   HELPERS
   ========================= */

$field = static function ($name) use ($band_id) {
  $value = get_post_meta($band_id, $name, true);

  return is_scalar($value) ? trim((string) $value) : '';
};

$icon = static function ($name) {
  $paths = [
    'pin' => '
      <path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 1 1 16 0Z"/>
      <circle cx="12" cy="10" r="2.5"/>
    ',
    'calendar' => '
      <rect x="3" y="5" width="18" height="16" rx="2"/>
      <path d="M16 3v4M8 3v4M3 11h18M7 15h2M12 15h2M7 18h2"/>
    ',
    'instagram' => '
      <rect x="3" y="3" width="18" height="18" rx="5"/>
      <circle cx="12" cy="12" r="4"/>
      <circle cx="17.5" cy="6.5" r=".8"
        fill="currentColor" stroke="none"/>
    ',
    'youtube' => '
      <rect x="2" y="5" width="20" height="14" rx="4"/>
      <path d="m10 9 5 3-5 3Z"
        fill="currentColor" stroke="none"/>
    ',
    'spotify' => '
      <circle cx="12" cy="12" r="10"/>
      <path
        d="M6.5 9c4-1.2 7.5-.8 11 1M7.5 12c3.2-.8 6.1-.5 9 1M8.5 15c2.5-.5 4.5-.2 6.8.7"
        stroke-linecap="round"/>
    ',
    'site' => '
      <circle cx="12" cy="12" r="9"/>
      <ellipse cx="12" cy="12" rx="4" ry="9"/>
      <path d="M3 12h18"/>
    ',
    'music' => '
      <path d="M9 18V5l12-2v13M9 9l12-2"/>
      <ellipse cx="6" cy="18" rx="3" ry="2"/>
      <ellipse cx="18" cy="16" rx="3" ry="2"/>
    ',
    'mail' => '
      <rect x="3" y="5" width="18" height="14" rx="2"/>
      <path d="m3 6 9 7 9-7"/>
    ',
    'check' => '
      <circle cx="12" cy="12" r="9"/>
      <path d="m8 12 3 3 5-6"/>
    ',
    'play' => '
      <circle cx="12" cy="12" r="9"/>
      <path d="m10 8 6 4-6 4Z"
        fill="currentColor" stroke="none"/>
    ',
  ];

  if (!isset($paths[$name])) {
    return '';
  }

  return '<svg
    class="band-single__icon"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="1.8"
    stroke-linejoin="round"
    stroke-linecap="round"
    aria-hidden="true">'
    . $paths[$name]
    . '</svg>';
};

/* =========================
   INFORMAÇÕES
   ========================= */

$bio = $field('banda_bio');
$city = $field('banda_cidade');
$formed = $field('banda_formacao');
$contact_url = esc_url($field('banda_contato_url'));

$bio_html = $bio
  ? wpautop(wp_kses_post($bio))
  : apply_filters('the_content', get_the_content());

$has_bio = trim(wp_strip_all_tags($bio_html)) !== '';

$intro = has_excerpt()
  ? get_the_excerpt()
  : wp_trim_words(
      wp_strip_all_tags(
        strip_shortcodes($bio ?: get_the_content())
      ),
      24
    );

$location = implode(' · ', array_filter([
  $city,
  $formed ? 'Desde ' . $formed : '',
]));

$bands_url = get_post_type_archive_link('banda') ?: home_url('/');
$agenda_url = get_post_type_archive_link('evento') ?: home_url('/');

/* =========================
   FORMULÁRIO
   ========================= */

$quote_enabled = $field('banda_form_ativo') === '1'
  && is_email($field('banda_email_orcamento'));

$quote_status = isset($_GET['orcamento'])
  && is_string($_GET['orcamento'])
    ? sanitize_key(wp_unslash($_GET['orcamento']))
    : '';

$quote_feedback = [
  'enviado' =>
    'Seu pedido foi encaminhado! A banda responderá pelo contato informado.',
  'dados' =>
    'Confira os campos obrigatórios e a data do evento. Preencha o formulário novamente.',
  'sessao' =>
    'A sessão do formulário expirou. Atualize a página e tente novamente.',
  'limite' =>
    'Você atingiu o limite de tentativas. Aguarde 15 minutos antes de tentar novamente.',
  'indisponivel' =>
    'O formulário está indisponível. Use os canais oficiais da banda.',
  'erro' =>
    'Não foi possível encaminhar o pedido. Tente novamente ou use os canais oficiais da banda.',
];

$has_booking = $quote_enabled || $contact_url;

/* =========================
   REDES
   ========================= */

$socials = [];

foreach ([
  'banda_site' => ['label' => 'Site', 'icon' => 'site'],
  'banda_instagram' => ['label' => 'Instagram', 'icon' => 'instagram'],
  'banda_youtube' => ['label' => 'YouTube', 'icon' => 'youtube'],
  'banda_spotify' => ['label' => 'Spotify', 'icon' => 'spotify'],
] as $key => $social) {
  $url = esc_url($field($key));

  if ($url) {
    $socials[] = [
      'label' => $social['label'],
      'icon'  => $social['icon'],
      'url'   => $url,
    ];
  }
}

/* =========================
   GALERIA
   ========================= */

$raw_gallery = function_exists('csamba_band_gallery')
  ? (array) csamba_band_gallery($band_id)
  : [];

$gallery = [];

foreach ($raw_gallery as $image_id) {
  if (
    is_numeric($image_id)
    && wp_attachment_is_image((int) $image_id)
  ) {
    $gallery[] = (int) $image_id;
  }
}

$gallery = array_values(array_unique($gallery));

/* =========================
   MÚSICAS E VÍDEOS
   ========================= */

$raw_tracks = function_exists('csamba_band_tracks')
  ? (array) csamba_band_tracks($band_id)
  : [];

$raw_clips = function_exists('csamba_band_clips')
  ? (array) csamba_band_clips($band_id)
  : [];

$tracks = [];
$clips = [];

foreach ($raw_tracks as $track) {
  if (!is_array($track)) {
    continue;
  }

  $url = isset($track['url']) && is_scalar($track['url'])
    ? esc_url((string) $track['url'])
    : '';

  if (!$url) {
    continue;
  }

  $tracks[] = [
    'url' => $url,
    'title' => isset($track['title']) && is_scalar($track['title'])
      ? trim((string) $track['title'])
      : '',
  ];
}

foreach ($raw_clips as $clip) {
  if (!is_array($clip)) {
    continue;
  }

  $url = isset($clip['url']) && is_scalar($clip['url'])
    ? esc_url((string) $clip['url'])
    : '';

  if (!$url) {
    continue;
  }

  $clips[] = [
    'url' => $url,
    'title' => isset($clip['title']) && is_scalar($clip['title'])
      ? trim((string) $clip['title'])
      : '',
    'thumb' => isset($clip['thumb']) && is_scalar($clip['thumb'])
      ? esc_url((string) $clip['thumb'])
      : '',
  ];
}

// Quando não existem faixas específicas, mostra os canais musicais.
$music_channels = [];

foreach ([
  'banda_spotify' => [
    'label' => 'No Spotify',
    'description' => 'Ouça as músicas da banda',
    'icon' => 'spotify',
  ],
  'banda_youtube' => [
    'label' => 'No YouTube',
    'description' => 'Assista aos clipes e shows',
    'icon' => 'youtube',
  ],
] as $key => $channel) {
  $url = esc_url($field($key));

  if ($url) {
    $music_channels[] = array_merge($channel, ['url' => $url]);
  }
}

$has_music = $tracks || $music_channels;
$has_media = $clips || $has_music;

/* =========================
   EVENTOS
   ========================= */

$band_events = new WP_Query([
  'post_type'      => 'evento',
  'post_status'    => 'publish',
  'posts_per_page' => 6,
  'no_found_rows'  => true,
  'meta_key'       => 'evento_data',
  'orderby'        => 'meta_value_num',
  'order'          => 'ASC',
  'meta_query'     => [
    'relation' => 'AND',
    [
      'relation' => 'OR',
      [
        'key'     => 'evento_banda',
        'value'   => (string) $band_id,
        'compare' => '=',
      ],
      [
        'key'     => 'evento_banda',
        'value'   => '"' . $band_id . '"',
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
   OUTROS ARTISTAS
   ========================= */

$related = get_posts([
  'post_type'      => 'banda',
  'post_status'    => 'publish',
  'posts_per_page' => 3,
  'post__not_in'   => [$band_id],
  'orderby'        => 'title',
  'order'          => 'ASC',
]);
?>

<main class="container band-single band-single--booking">

  <!-- Breadcrumb -->
  <nav
    class="band-single__breadcrumb"
    aria-label="Navegação estrutural"
  >
    <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>
    <span aria-hidden="true">›</span>

    <a href="<?php echo esc_url($bands_url); ?>">
      Bandas e artistas
    </a>

    <span aria-hidden="true">›</span>

    <span aria-current="page">
      <?php echo esc_html($band_title); ?>
    </span>
  </nav>

  <!-- Hero -->
  <header class="band-single__hero">
    <div class="band-single__portrait">
      <?php if (has_post_thumbnail($band_id)): ?>
        <?php echo get_the_post_thumbnail(
          $band_id,
          'large',
          [
            'class'         => 'band-single__hero-image',
            'fetchpriority' => 'high',
            'decoding'      => 'async',
          ]
        ); ?>
      <?php else: ?>
        <img
          class="band-single__hero-image"
          src="<?php echo esc_url(csamba_placeholder($band_title)); ?>"
          alt=""
          fetchpriority="high"
          decoding="async"
        >
      <?php endif; ?>
    </div>

    <div class="band-single__profile">
      <a
        class="band-single__eyebrow"
        href="<?php echo esc_url($bands_url); ?>"
      >
        Bandas e artistas
      </a>

      <h1><?php echo esc_html($band_title); ?></h1>

      <?php if ($location): ?>
        <p class="band-single__meta">
          <?php echo $icon('pin'); ?>
          <span><?php echo esc_html($location); ?></span>
        </p>
      <?php endif; ?>

      <?php if ($intro): ?>
        <p class="band-single__intro">
          <?php echo esc_html($intro); ?>
        </p>
      <?php endif; ?>

      <div class="band-single__actions">
        <a class="band-single__button" href="#agenda">
          Ver próximos shows
          <span aria-hidden="true">↓</span>
        </a>

        <?php if ($has_booking): ?>
          <a
            class="band-single__button band-single__button--outline"
            href="#orcamento"
          >
            <?php echo $quote_enabled
              ? 'Solicitar orçamento'
              : 'Contato para shows'; ?>
            <span aria-hidden="true">↓</span>
          </a>
        <?php endif; ?>
      </div>

      <?php if ($socials): ?>
        <nav
          class="band-single__socials"
          aria-label="Canais oficiais"
        >
          <?php foreach ($socials as $social): ?>
            <a
              href="<?php echo esc_url($social['url']); ?>"
              target="_blank"
              rel="noopener noreferrer"
              title="<?php echo esc_attr($social['label']); ?>"
              aria-label="<?php echo esc_attr(
                $social['label']
                . ' de '
                . $band_title
                . ' (abre em nova aba)'
              ); ?>"
            >
              <?php echo $icon($social['icon']); ?>
            </a>
          <?php endforeach; ?>
        </nav>
      <?php endif; ?>
    </div>
  </header>

  <!-- Navegação: uma opção por grupo de conteúdo -->
  <nav class="band-single__nav" aria-label="Nesta página">
    <a href="#visao-geral" aria-current="location">
      Visão geral
    </a>

    <?php if ($gallery): ?>
      <a href="#fotos">Fotos</a>
    <?php endif; ?>

    <?php if ($has_media): ?>
      <a href="#som-movimento">Som e movimento</a>
    <?php endif; ?>

    <?php if ($has_booking): ?>
      <a href="#orcamento">Contrate a banda</a>
    <?php endif; ?>
  </nav>

  <!-- Visão geral: biografia e agenda juntas -->
  <div
    class="band-single__overview"
    id="visao-geral"
  >
    <section
      class="band-single__panel band-single__about"
      aria-labelledby="band-about-title"
    >
      <h2 class="band-single__title" id="band-about-title">
        Sobre a banda
      </h2>

      <div class="band-single__bio">
        <?php if ($has_bio): ?>
          <?php echo wp_kses_post($bio_html); ?>
        <?php else: ?>
          <p>Em breve, mais informações sobre a banda.</p>
        <?php endif; ?>
      </div>
    </section>

    <aside
      class="band-single__panel band-single__agenda"
      id="agenda"
      aria-labelledby="band-agenda-title"
    >
      <h2
        class="band-single__title band-single__title--icon"
        id="band-agenda-title"
      >
        <?php echo $icon('calendar'); ?>
        Próximos shows
      </h2>

      <?php if ($band_events->posts): ?>
        <div class="band-single__events">
          <?php foreach ($band_events->posts as $event):
            $event_id = $event->ID;

            $raw_date = get_post_meta(
              $event_id,
              'evento_data',
              true
            );

            $raw_date = is_scalar($raw_date)
              ? trim((string) $raw_date)
              : '';

            $date = DateTimeImmutable::createFromFormat(
              '!Ymd',
              $raw_date,
              wp_timezone()
            );

            $valid_date = $date
              && $date->format('Ymd') === $raw_date;

            $time = get_post_meta(
              $event_id,
              'evento_hora',
              true
            );

            $time = is_scalar($time)
              ? trim((string) $time)
              : '';

            if (preg_match('/^\d{2}:\d{2}(?::\d{2})?$/', $time)) {
              $time = substr($time, 0, 5);
            }

            $venue_value = get_post_meta(
              $event_id,
              'evento_casa',
              true
            );

            $venue_ids = is_array($venue_value)
              ? $venue_value
              : [$venue_value];

            $venues = [];

            foreach ($venue_ids as $venue_id) {
              if (is_numeric($venue_id) && (int) $venue_id > 0) {
                $venue_title = get_the_title((int) $venue_id);

                if ($venue_title) {
                  $venues[] = $venue_title;
                }
              }
            }

            $details = implode(' · ', array_filter([
              $time,
              implode(', ', array_unique($venues)),
            ]));
            ?>

            <a
              class="band-single__event"
              href="<?php echo esc_url(get_permalink($event_id)); ?>"
            >
              <span
                class="band-single__event-date"
                aria-hidden="true"
              >
                <strong>
                  <?php echo $valid_date
                    ? esc_html($date->format('d'))
                    : '—'; ?>
                </strong>

                <small>
                  <?php echo $valid_date
                    ? esc_html(wp_date(
                      'M',
                      $date->getTimestamp(),
                      wp_timezone()
                    ))
                    : ''; ?>
                </small>
              </span>

              <span class="band-single__event-copy">
                <strong>
                  <?php echo esc_html(get_the_title($event_id)); ?>
                </strong>

                <?php if ($valid_date): ?>
                  <time datetime="<?php echo esc_attr(
                    $date->format('Y-m-d')
                  ); ?>">
                    <?php echo esc_html($date->format('d/m/Y')); ?>
                  </time>
                <?php endif; ?>

                <?php if ($details): ?>
                  <small><?php echo esc_html($details); ?></small>
                <?php endif; ?>
              </span>

              <span aria-hidden="true">→</span>
            </a>

          <?php endforeach; ?>
        </div>
      <?php else: ?>
        <div class="band-single__empty">
          <?php echo $icon('calendar'); ?>
          <h3>Novas datas em breve</h3>
          <p>
            Assim que novos eventos forem cadastrados,
            eles aparecem aqui.
          </p>
        </div>
      <?php endif; ?>

      <a
        class="band-single__button band-single__button--outline"
        href="<?php echo esc_url($agenda_url); ?>"
      >
        Explore a agenda do CSamba
        <span aria-hidden="true">→</span>
      </a>
    </aside>
  </div>

  <!-- Galeria -->
  <?php if ($gallery): ?>
    <section class="band-single__section" id="fotos">
      <h2 class="band-single__title">A banda em imagens</h2>

      <div class="band-single__gallery">
        <?php foreach ($gallery as $image_id):
          $full_url = wp_get_attachment_image_url(
            $image_id,
            'full'
          );

          if (!$full_url) {
            continue;
          }
          ?>

          <a
            href="<?php echo esc_url($full_url); ?>"
            data-band-photo
            aria-label="<?php echo esc_attr(
              'Ampliar foto de ' . $band_title
            ); ?>"
          >
            <?php echo wp_get_attachment_image(
              $image_id,
              'medium_large',
              false,
              [
                'loading'  => 'lazy',
                'decoding' => 'async',
              ]
            ); ?>

            <span class="band-single__zoom" aria-hidden="true">
              ↗
            </span>
          </a>
        <?php endforeach; ?>
      </div>
    </section>
  <?php endif; ?>

  <!-- Vídeos e músicas -->
  <?php if ($has_media): ?>
    <section class="band-single__section" id="som-movimento">
      <h2 class="band-single__title">Som e movimento</h2>

      <div class="band-single__media">
        <?php if ($clips): ?>
          <section class="band-single__panel" id="clipes">
            <h3 class="band-single__subtitle">
              <?php echo $icon('youtube'); ?>
              Assista
            </h3>

            <div class="band-single__clips">
              <?php foreach ($clips as $clip):
                $clip_title = $clip['title']
                  ?: 'Vídeo de ' . $band_title;
                ?>

                <article class="band-single__clip">
                  <a
                    href="<?php echo esc_url($clip['url']); ?>"
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label="<?php echo esc_attr(
                      $clip_title . ' (abre em nova aba)'
                    ); ?>"
                  >
                    <div class="band-single__clip-image">
                      <?php if ($clip['thumb']): ?>
                        <img
                          src="<?php echo esc_url($clip['thumb']); ?>"
                          alt=""
                          loading="lazy"
                          decoding="async"
                        >
                      <?php endif; ?>

                      <span
                        class="band-single__play"
                        aria-hidden="true"
                      >▶</span>
                    </div>

                    <h4><?php echo esc_html($clip_title); ?></h4>
                  </a>
                </article>
              <?php endforeach; ?>
            </div>
          </section>
        <?php endif; ?>

        <?php if ($has_music): ?>
          <section class="band-single__panel" id="musicas">
            <h3 class="band-single__subtitle">
              <?php echo $icon('music'); ?>
              Ouça a banda
            </h3>

            <?php if ($tracks): ?>
              <ol class="band-single__tracks">
                <?php foreach ($tracks as $index => $track):
                  $track_title = $track['title']
                    ?: 'Faixa ' . ($index + 1);
                  ?>

                  <li>
                    <span class="band-single__track-number">
                      <?php echo esc_html(str_pad(
                        (string) ($index + 1),
                        2,
                        '0',
                        STR_PAD_LEFT
                      )); ?>
                    </span>

                    <div class="band-single__track-copy">
                      <strong>
                        <?php echo esc_html($track_title); ?>
                      </strong>

                      <a
                        href="<?php echo esc_url($track['url']); ?>"
                        target="_blank"
                        rel="noopener noreferrer"
                        aria-label="<?php echo esc_attr(
                          'Ouvir '
                          . $track_title
                          . ' (abre em nova aba)'
                        ); ?>"
                      >
                        Ouvir faixa
                        <span aria-hidden="true">↗</span>
                      </a>
                    </div>
                  </li>
                <?php endforeach; ?>
              </ol>
            <?php else: ?>
              <div class="band-music-links">
                <?php foreach ($music_channels as $channel): ?>
                  <a
                    class="band-music-link"
                    href="<?php echo esc_url($channel['url']); ?>"
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label="<?php echo esc_attr(
                      $channel['label'] . ' (abre em nova aba)'
                    ); ?>"
                  >
                    <span class="band-music-link__icon">
                      <?php echo $icon($channel['icon']); ?>
                    </span>

                    <span class="band-music-link__copy">
                      <strong>
                        <?php echo esc_html($channel['label']); ?>
                      </strong>
                      <small>
                        <?php echo esc_html($channel['description']); ?>
                      </small>
                    </span>

                    <span aria-hidden="true">›</span>
                  </a>
                <?php endforeach; ?>
              </div>
            <?php endif; ?>
          </section>
        <?php endif; ?>
      </div>
    </section>
  <?php endif; ?>

  <!-- Contratação -->
  <?php if ($has_booking): ?>
    <section
      class="band-single__section band-booking"
      id="orcamento"
      aria-labelledby="band-booking-title"
    >
      <h2 class="band-single__title" id="band-booking-title">
        Contrate a banda
      </h2>

      <?php if ($quote_enabled): ?>
        <div class="band-booking__card">

          <div class="band-booking__intro">
            <span class="band-booking__mail">
              <?php echo $icon('mail'); ?>
            </span>

            <h3>Samba no seu evento</h3>

            <p>
              Conte sua ideia e receba uma proposta
              de <?php echo esc_html($band_title); ?>.
            </p>

            <ul class="band-booking__benefits">
              <li>
                <?php echo $icon('check'); ?>
                Contato direto com a banda
              </li>
              <li>
                <?php echo $icon('check'); ?>
                Sem compromisso
              </li>
            </ul>

            <?php if ($contact_url): ?>
              <a
                class="band-single__button band-single__button--outline"
                href="<?php echo esc_url($contact_url); ?>"
                target="_blank"
                rel="noopener noreferrer"
              >
                Prefere contato direto?
                <span aria-hidden="true">↗</span>
              </a>
            <?php endif; ?>
          </div>

          <div class="band-booking__body">
            <?php if (isset($quote_feedback[$quote_status])): ?>
              <div
                class="band-quote__feedback<?php
                  echo $quote_status === 'enviado'
                    ? ' band-quote__feedback--success'
                    : '';
                ?>"
                role="<?php echo $quote_status === 'enviado'
                  ? 'status'
                  : 'alert'; ?>"
              >
                <?php echo esc_html(
                  $quote_feedback[$quote_status]
                ); ?>
              </div>
            <?php endif; ?>

            <form
              class="band-quote__form"
              method="post"
              action="<?php echo esc_url(
                admin_url('admin-post.php')
              ); ?>"
            >
              <input
                type="hidden"
                name="action"
                value="csamba_band_quote"
              >

              <input
                type="hidden"
                name="band_id"
                value="<?php echo esc_attr($band_id); ?>"
              >

              <?php wp_nonce_field(
                'csamba_band_quote_' . $band_id,
                'quote_nonce',
                false
              ); ?>

              <div
                class="band-quote__trap"
                aria-hidden="true"
                inert
              >
                <label for="quote-company-website">
                  Não preencha este campo
                </label>
                <input
                  id="quote-company-website"
                  name="quote_company_website"
                  type="text"
                  tabindex="-1"
                  autocomplete="off"
                >
              </div>

              <div class="band-quote__grid">
                <div class="band-quote__field">
                  <label for="quote-name">
                    Seu nome <span aria-hidden="true">*</span>
                  </label>
                  <input
                    id="quote-name"
                    name="quote_name"
                    type="text"
                    autocomplete="name"
                    maxlength="100"
                    placeholder="Digite seu nome"
                    required
                  >
                </div>

                <div class="band-quote__field">
                  <label for="quote-email">
                    E-mail <span aria-hidden="true">*</span>
                  </label>
                  <input
                    id="quote-email"
                    name="quote_email"
                    type="email"
                    autocomplete="email"
                    maxlength="254"
                    placeholder="seu@email.com"
                    required
                  >
                </div>

                <div class="band-quote__field">
                  <label for="quote-phone">
                    WhatsApp <span aria-hidden="true">*</span>
                  </label>
                  <input
                    id="quote-phone"
                    name="quote_phone"
                    type="tel"
                    autocomplete="tel"
                    maxlength="40"
                    placeholder="(51) 99999-9999"
                    required
                  >
                </div>

                <div class="band-quote__field">
                  <label for="quote-date">Data do evento</label>
                  <input
                    id="quote-date"
                    name="quote_date"
                    type="date"
                    min="<?php echo esc_attr(
                      current_time('Y-m-d')
                    ); ?>"
                    aria-describedby="quote-date-help"
                  >
                  <small id="quote-date-help">
                    Opcional, se ainda estiver a combinar.
                  </small>
                </div>

                <div class="band-quote__field">
                  <label for="quote-city">
                    Cidade / UF <span aria-hidden="true">*</span>
                  </label>
                  <input
                    id="quote-city"
                    name="quote_city"
                    type="text"
                    maxlength="100"
                    placeholder="Ex.: Porto Alegre / RS"
                    required
                  >
                </div>

                <div class="band-quote__field">
                  <label for="quote-type">
                    Tipo de evento <span aria-hidden="true">*</span>
                  </label>
                  <select
                    id="quote-type"
                    name="quote_type"
                    required
                  >
                    <option value="">Selecione uma opção</option>
                    <option value="particular">Festa particular</option>
                    <option value="casamento">Casamento</option>
                    <option value="corporativo">Evento corporativo</option>
                    <option value="bar_casa">Bar / casa de shows</option>
                    <option value="outro">Outro</option>
                  </select>
                </div>

                <div class="band-quote__field band-quote__field--full">
                  <label for="quote-message">
                    Conte sobre o evento
                    <span aria-hidden="true">*</span>
                  </label>
                  <textarea
                    id="quote-message"
                    name="quote_message"
                    rows="4"
                    maxlength="2000"
                    placeholder="Conte mais detalhes sobre seu evento, público, local e horário."
                    required
                  ></textarea>
                </div>
              </div>

              <div class="band-booking__form-footer">
                <label class="band-quote__consent">
                  <input
                    type="checkbox"
                    name="quote_consent"
                    value="1"
                    required
                  >
                  <span>
                    Autorizo o envio dos meus dados à banda
                    para responder ao pedido.
                  </span>
                </label>

                <button
                  class="band-single__button"
                  type="submit"
                >
                  Solicitar orçamento
                </button>
              </div>

              <p class="band-booking__note">
                O envio não confirma contratação
                nem disponibilidade da banda.
              </p>
            </form>
          </div>
        </div>

      <?php else: ?>

        <div class="band-single__contact">
          <div>
            <h3>Leve esse samba para o seu evento.</h3>
            <p>Fale com a banda e consulte a disponibilidade.</p>
          </div>

          <a
            class="band-single__button"
            href="<?php echo esc_url($contact_url); ?>"
            target="_blank"
            rel="noopener noreferrer"
          >
            Contato para shows
            <span aria-hidden="true">↗</span>
          </a>
        </div>

      <?php endif; ?>
    </section>
  <?php endif; ?>

  <!-- Outros artistas -->
  <?php if ($related): ?>
    <section class="band-single__section">
      <h2 class="band-single__title">
        Mais artistas para conhecer
      </h2>

      <div class="band-single__related">
        <?php foreach ($related as $artist):
          $artist_title = get_the_title($artist);

          $artist_city_value = get_post_meta(
            $artist->ID,
            'banda_cidade',
            true
          );

          $artist_city = is_scalar($artist_city_value)
            ? trim((string) $artist_city_value)
            : '';
          ?>

          <article>
            <a href="<?php echo esc_url(
              get_permalink($artist)
            ); ?>">
              <div class="band-single__related-image">
                <img
                  src="<?php echo esc_url(
                    csamba_image_url(
                      $artist->ID,
                      'medium_large',
                      $artist_title
                    )
                  ); ?>"
                  alt=""
                  loading="lazy"
                  decoding="async"
                >
              </div>

              <div class="band-single__related-copy">
                <h3><?php echo esc_html($artist_title); ?></h3>

                <?php if ($artist_city): ?>
                  <p class="band-related-city">
                    <?php echo $icon('pin'); ?>
                    <?php echo esc_html($artist_city); ?>
                  </p>
                <?php endif; ?>

                <span class="band-related-link">
                  Ver perfil
                  <span aria-hidden="true">→</span>
                </span>
              </div>
            </a>
          </article>
        <?php endforeach; ?>
      </div>
    </section>
  <?php endif; ?>

  <!-- Modal da galeria -->
  <?php if ($gallery): ?>
    <dialog
      class="band-lightbox"
      aria-label="Foto ampliada da banda"
    >
      <div class="band-lightbox__content">
        <button
          type="button"
          class="band-lightbox__close"
          aria-label="Fechar foto ampliada"
          autofocus
        >×</button>

        <img class="band-lightbox__image" alt="">
      </div>
    </dialog>
  <?php endif; ?>

</main>

<?php get_footer(); ?>