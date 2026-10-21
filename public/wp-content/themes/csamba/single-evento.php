<?php
if (!defined('ABSPATH')) {
  exit;
}

get_header();

if (!have_posts()) {
  get_footer();
  return;
}

the_post();

$event_id = get_the_ID();
$event_title = get_the_title();
$event_url = get_permalink();

/* =========================
   HELPERS
   ========================= */

$meta = static function ($id, $key) {
  $value = get_post_meta($id, $key, true);

  return is_scalar($value) ? trim((string) $value) : '';
};

$relation_ids = static function ($value, $post_type) {
  $values = is_array($value) ? $value : [$value];
  $ids = [];

  foreach ($values as $value) {
    if (!is_numeric($value)) {
      continue;
    }

    $id = (int) $value;

    if (
      $id > 0
      && get_post_type($id) === $post_type
      && get_post_status($id) === 'publish'
    ) {
      $ids[] = $id;
    }
  }

  return array_values(array_unique($ids));
};

$parse_date = static function ($value) {
  $date = DateTimeImmutable::createFromFormat(
    '!Ymd',
    $value,
    wp_timezone()
  );

  return $date && $date->format('Ymd') === $value
    ? $date
    : false;
};

$icon = static function ($name) {
  $paths = [
    'calendar' => '
      <rect x="3" y="5" width="18" height="16" rx="2"/>
      <path d="M8 3v4M16 3v4M3 11h18M7 15h2M12 15h2M7 18h2"/>
    ',
    'clock' => '
      <circle cx="12" cy="12" r="9"/>
      <path d="M12 7v5l3 2"/>
    ',
    'pin' => '
      <path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 1 1 16 0Z"/>
      <circle cx="12" cy="10" r="2.5"/>
    ',
    'ticket' => '
      <path d="M3 7h18v4a2 2 0 0 0 0 4v4H3v-4a2 2 0 0 0 0-4Z"/>
      <path d="M15 7v2M15 12v2M15 17v2"/>
    ',
    'home' => '
      <path d="m3 10 9-7 9 7"/>
      <path d="M5 9v12h14V9M9 21v-8h6v8"/>
    ',
    'link' => '
      <path d="m10 13 4-4"/>
      <path d="m8 16-1 1a3.5 3.5 0 0 1-5-5l4-4a3.5 3.5 0 0 1 5 0"/>
      <path d="m16 8 1-1a3.5 3.5 0 0 1 5 5l-4 4a3.5 3.5 0 0 1-5 0"/>
    ',
    'share' => '
      <circle cx="18" cy="5" r="3"/>
      <circle cx="6" cy="12" r="3"/>
      <circle cx="18" cy="19" r="3"/>
      <path d="m8.6 10.5 6.8-4M8.6 13.5l6.8 4"/>
    ',
    'alert' => '
      <circle cx="12" cy="12" r="9"/>
      <path d="M12 7v6M12 17h.01"/>
    ',
  ];

  if (!isset($paths[$name])) {
    return '';
  }

  return '<svg class="event-icon" width="24" height="24"
    viewBox="0 0 24 24" fill="none" stroke="currentColor"
    stroke-width="1.8" stroke-linecap="round"
    stroke-linejoin="round" aria-hidden="true">'
    . $paths[$name]
    . '</svg>';
};

/* =========================
   DADOS DO EVENTO
   ========================= */

$date = $parse_date($meta($event_id, 'evento_data'));
$time = $meta($event_id, 'evento_hora');

if (preg_match('/^\d{2}:\d{2}(?::\d{2})?$/', $time)) {
  $time = substr($time, 0, 5);
}

$date_label = $date
  ? wp_date(
      'l, d \d\e F \d\e Y',
      $date->getTimestamp(),
      wp_timezone()
    )
  : 'Data a confirmar';

$time_label = $time
  ? 'A partir das ' . $time
  : 'Horário a confirmar';

$today = new DateTimeImmutable('today', wp_timezone());
$is_past = $date && $date < $today;

$free = $meta($event_id, 'evento_gratuito') === '1';
$price = $meta($event_id, 'evento_preco');

$price_label = $free
  ? 'Entrada gratuita'
  : ($price ?: 'Consulte os valores com a organização');

$tickets_url = esc_url($meta($event_id, 'evento_ingressos'));
$contact_url = esc_url($meta($event_id, 'evento_contato_url'));

$description = $meta($event_id, 'evento_descricao');

$description_html = $description
  ? wpautop(wp_kses_post($description))
  : apply_filters('the_content', get_the_content());

$has_description = trim(wp_strip_all_tags($description_html)) !== '';

$band_ids = $relation_ids(
  get_post_meta($event_id, 'evento_banda', true),
  'banda'
);

$house_ids = $relation_ids(
  get_post_meta($event_id, 'evento_casa', true),
  'casa'
);

$band_names = array_map('get_the_title', $band_ids);

/* =========================
   CASAS E MAPAS
   ========================= */

$venues = [];

foreach ($house_ids as $house_id) {
  $name = get_the_title($house_id);
  $street = implode(', ', array_filter([
    $meta($house_id, 'casa_endereco'),
    $meta($house_id, 'casa_numero'),
  ]));

  $neighborhood = $meta($house_id, 'casa_bairro');
  $city = $meta($house_id, 'casa_cidade');
  $state = $meta($house_id, 'casa_estado');
  $zip = $meta($house_id, 'casa_cep');

  $location = implode(' · ', array_filter([
    $neighborhood,
    implode(' / ', array_filter([$city, $state])),
  ]));

  $address = implode(' · ', array_filter([
    $street,
    $meta($house_id, 'casa_complemento'),
    $location,
    $zip ? 'CEP ' . $zip : '',
  ]));

  $map_query = implode(', ', array_filter([
    $street,
    $neighborhood,
    $city,
    $state,
    $zip,
    'Brasil',
  ]));

  $maps_url = esc_url($meta($house_id, 'casa_maps'));

  if (!$maps_url && ($street || $city)) {
    $maps_url = 'https://www.google.com/maps/search/?api=1&query='
      . rawurlencode($map_query);
  }

  $embed_url = ($meta($house_id, 'casa_endereco') && $city)
    ? 'https://maps.google.com/maps?q='
      . rawurlencode($map_query)
      . '&z=16&output=embed'
    : '';

  $house_description = $meta($house_id, 'casa_descricao')
    ?: get_post_field('post_content', $house_id);

  $venues[] = [
    'id'       => $house_id,
    'title'    => $name,
    'url'      => get_permalink($house_id),
    'location' => $location,
    'address'  => $address,
    'maps'     => $maps_url,
    'embed'    => $embed_url,
    'summary'  => wp_trim_words(
      wp_strip_all_tags(strip_shortcodes($house_description)),
      30
    ),
  ];

  // Canal de contato alternativo, se o evento não tiver um próprio.
  if (!$contact_url) {
    $digits = preg_replace(
      '/\D+/',
      '',
      $meta($house_id, 'casa_whatsapp')
    );

    if (in_array(strlen($digits), [10, 11], true)) {
      $digits = '55' . $digits;
    }

    $contact_url = $digits
      ? 'https://wa.me/' . $digits
      : esc_url($meta($house_id, 'casa_instagram'));
  }
}

$venue_labels = [];

foreach ($venues as $venue) {
  $venue_labels[] = implode(' · ', array_filter([
    $venue['title'],
    $venue['location'],
  ]));
}

$hero_location = implode(' / ', $venue_labels);

$has_location = false;

foreach ($venues as $venue) {
  if ($venue['address'] || $venue['maps'] || $venue['embed']) {
    $has_location = true;
    break;
  }
}

/* =========================
   COMPARTILHAMENTO
   ========================= */

$share_text = $event_title . ' — CSamba ' . $event_url;

$whatsapp_share = 'https://wa.me/?text=' . rawurlencode($share_text);

$facebook_share = 'https://www.facebook.com/sharer/sharer.php?u='
  . rawurlencode($event_url);

$agenda_url = get_post_type_archive_link('evento') ?: home_url('/');

/* =========================
   OUTROS EVENTOS
   ========================= */

$related = get_posts([
  'post_type'      => 'evento',
  'post_status'    => 'publish',
  'posts_per_page' => 3,
  'post__not_in'   => [$event_id],
  'meta_key'      => 'evento_data',
  'orderby'       => 'meta_value_num',
  'order'         => 'ASC',
  'meta_query'    => [
    [
      'key'     => 'evento_data',
      'value'   => current_time('Ymd'),
      'compare' => '>=',
      'type'    => 'NUMERIC',
    ],
  ],
]);
?>

<main
  class="container event-single"
  data-event-title="<?php echo esc_attr($event_title); ?>"
  data-event-url="<?php echo esc_url($event_url); ?>"
>

  <!-- Breadcrumb -->
  <nav class="event-breadcrumb" aria-label="Navegação estrutural">
    <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>
    <span aria-hidden="true">›</span>
    <a href="<?php echo esc_url($agenda_url); ?>">Agenda</a>
    <span aria-hidden="true">›</span>
    <span aria-current="page"><?php echo esc_html($event_title); ?></span>
  </nav>

  <!-- Hero -->
  <header class="event-hero">
    <div class="event-hero__media">
      <img
        src="<?php echo esc_url(csamba_image_url(
          $event_id,
          'large',
          $event_title
        )); ?>"
        alt="<?php echo esc_attr('Imagem de divulgação: ' . $event_title); ?>"
        fetchpriority="high"
        decoding="async"
      >
    </div>

    <div class="event-hero__copy">
      <a class="event-eyebrow" href="<?php echo esc_url($agenda_url); ?>">
        <?php echo $icon('calendar'); ?>
        Agenda CSamba
      </a>

      <?php if ($is_past): ?>
        <span class="event-past">Este evento já aconteceu</span>
      <?php endif; ?>

      <h1><?php echo esc_html($event_title); ?></h1>

      <?php if ($band_names): ?>
        <p class="event-hero__artists">
          Com <?php echo esc_html(implode(', ', $band_names)); ?>
        </p>
      <?php endif; ?>

      <ul class="event-facts">
        <li>
          <?php echo $icon('calendar'); ?>
          <?php if ($date): ?>
            <time datetime="<?php echo esc_attr($date->format('Y-m-d')); ?>">
              <?php echo esc_html($date_label); ?>
            </time>
          <?php else: ?>
            <span><?php echo esc_html($date_label); ?></span>
          <?php endif; ?>
        </li>

        <li>
          <?php echo $icon('clock'); ?>
          <span><?php echo esc_html($time_label); ?></span>
        </li>

        <li>
          <?php echo $icon('pin'); ?>
          <span><?php echo esc_html($hero_location ?: 'Local a confirmar'); ?></span>
        </li>

        <li>
          <?php echo $icon('ticket'); ?>
          <span><?php echo esc_html($price_label); ?></span>
        </li>
      </ul>

      <div class="event-hero__actions">
        <?php if ($tickets_url && !$is_past): ?>
          <a
            class="event-button"
            href="<?php echo esc_url($tickets_url); ?>"
            target="_blank"
            rel="noopener noreferrer"
          >
            Ver ingressos <span aria-hidden="true">↗</span>
          </a>
        <?php elseif ($contact_url && !$is_past): ?>
          <a
            class="event-button"
            href="<?php echo esc_url($contact_url); ?>"
            target="_blank"
            rel="noopener noreferrer"
          >
            Consultar informações <span aria-hidden="true">↗</span>
          </a>
        <?php else: ?>
          <a class="event-button" href="<?php echo esc_url($agenda_url); ?>">
            Explorar a agenda <span aria-hidden="true">→</span>
          </a>
        <?php endif; ?>

        <?php if ($has_location): ?>
          <a class="event-button event-button--outline" href="#evento-localizacao">
            Como chegar <span aria-hidden="true">↓</span>
          </a>
        <?php endif; ?>
      </div>

      <div class="event-share">
        <span>Compartilhar evento</span>

        <div class="event-share__links">
          <a
            href="<?php echo esc_url($whatsapp_share); ?>"
            target="_blank"
            rel="noopener noreferrer"
          >WhatsApp ↗</a>

          <a
            href="<?php echo esc_url($facebook_share); ?>"
            target="_blank"
            rel="noopener noreferrer"
          >Facebook ↗</a>

          <button type="button" data-event-share hidden>
            <?php echo $icon('share'); ?>
            Compartilhar
          </button>

          <button type="button" data-event-copy hidden>
            <?php echo $icon('link'); ?>
            Copiar link
          </button>
        </div>

        <p class="event-sr-only" data-event-share-status role="status"></p>
      </div>
    </div>
  </header>

  <!-- Menu -->
  <nav class="event-section-nav" aria-label="Nesta página">
    <a href="#evento-visao-geral" aria-current="location">Visão geral</a>

    <?php if ($band_ids): ?>
      <a href="#evento-atracoes">Atrações</a>
    <?php endif; ?>

    <?php if ($venues): ?>
      <a href="#evento-casa">O local</a>
    <?php endif; ?>

    <?php if ($has_location): ?>
      <a href="#evento-localizacao">Localização</a>
    <?php endif; ?>

    <?php if ($related): ?>
      <a href="#evento-relacionados">Mais eventos</a>
    <?php endif; ?>
  </nav>

  <!-- Visão geral -->
  <div class="event-overview" id="evento-visao-geral">
    <section class="event-panel">
      <h2 class="event-title">Sobre o evento</h2>

      <div class="event-prose">
        <?php if ($has_description): ?>
          <?php echo wp_kses_post($description_html); ?>
        <?php else: ?>
          <p>
            Confira os detalhes de data, horário e local nesta página.
            Para outras informações, consulte os canais oficiais do evento.
          </p>
        <?php endif; ?>
      </div>
    </section>

    <aside class="event-panel event-plan" aria-labelledby="event-plan-title">
      <h2 class="event-title" id="event-plan-title">Programe-se</h2>

      <ul class="event-plan__facts">
        <li>
          <?php echo $icon('calendar'); ?>
          <span><?php echo esc_html($date_label); ?></span>
        </li>
        <li>
          <?php echo $icon('clock'); ?>
          <span><?php echo esc_html($time_label); ?></span>
        </li>
        <li>
          <?php echo $icon('ticket'); ?>
          <span><?php echo esc_html($price_label); ?></span>
        </li>
      </ul>

      <?php if ($is_past): ?>
        <p>Este evento já aconteceu. Confira as próximas datas na agenda.</p>
        <a class="event-button" href="<?php echo esc_url($agenda_url); ?>">
          Ver próximos eventos →
        </a>
      <?php elseif ($tickets_url): ?>
        <p>Consulte as condições de entrada no canal oficial.</p>
        <a
          class="event-button"
          href="<?php echo esc_url($tickets_url); ?>"
          target="_blank"
          rel="noopener noreferrer"
        >Ver ingressos ↗</a>
        <small>Você será direcionado ao canal informado pelo evento.</small>
      <?php elseif ($contact_url): ?>
        <a
          class="event-button"
          href="<?php echo esc_url($contact_url); ?>"
          target="_blank"
          rel="noopener noreferrer"
        >Falar com a organização ↗</a>
      <?php else: ?>
        <p>Confirme as condições de entrada com a organização.</p>
      <?php endif; ?>
    </aside>
  </div>
  <?php if ($band_ids || $venues): ?>
    <div class="event-profiles-grid">
    <!-- Atrações -->
      <?php if ($band_ids): ?>
        <section class="event-section" id="evento-atracoes">
          <h2 class="event-title">Quem faz a roda</h2>

          <div class="event-profile-list">
            <?php foreach ($band_ids as $band_id):
              $name = get_the_title($band_id);
              $city = $meta($band_id, 'banda_cidade');
              $bio = $meta($band_id, 'banda_bio')
                ?: get_post_field('post_content', $band_id);

              $summary = wp_trim_words(
                wp_strip_all_tags(strip_shortcodes($bio)),
                38
              );
              ?>
              <article class="event-profile">
                <a
                  class="event-profile__image"
                  href="<?php echo esc_url(get_permalink($band_id)); ?>"
                  tabindex="-1"
                  aria-hidden="true"
                >
                  <img
                    src="<?php echo esc_url(csamba_image_url(
                      $band_id,
                      'medium_large',
                      $name
                    )); ?>"
                    alt=""
                    loading="lazy"
                    decoding="async"
                  >
                </a>

                <div class="event-profile__copy">
                  <h3>
                    <a href="<?php echo esc_url(get_permalink($band_id)); ?>">
                      <?php echo esc_html($name); ?>
                    </a>
                  </h3>

                  <?php if ($city): ?>
                    <p class="event-location">
                      <?php echo $icon('pin'); ?>
                      <?php echo esc_html($city); ?>
                    </p>
                  <?php endif; ?>

                  <?php if ($summary): ?>
                    <p><?php echo esc_html($summary); ?></p>
                  <?php endif; ?>

                  <a class="event-text-link" href="<?php echo esc_url(get_permalink($band_id)); ?>">
                    Conhecer a banda →
                  </a>
                </div>
              </article>
            <?php endforeach; ?>
          </div>
        </section>
      <?php endif; ?>

      <!-- Casas -->
      <?php if ($venues): ?>
        <section class="event-section" id="evento-casa">
          <h2 class="event-title">O lugar do encontro</h2>

          <div class="event-profile-list">
            <?php foreach ($venues as $venue): ?>
              <article class="event-profile">
                <a
                  class="event-profile__image"
                  href="<?php echo esc_url($venue['url']); ?>"
                  tabindex="-1"
                  aria-hidden="true"
                >
                  <img
                    src="<?php echo esc_url(csamba_image_url(
                      $venue['id'],
                      'medium_large',
                      $venue['title']
                    )); ?>"
                    alt=""
                    loading="lazy"
                    decoding="async"
                  >
                </a>

                <div class="event-profile__copy">
                  <span class="event-house-label">
                    <?php echo $icon('home'); ?> Casa de samba
                  </span>

                  <h3>
                    <a href="<?php echo esc_url($venue['url']); ?>">
                      <?php echo esc_html($venue['title']); ?>
                    </a>
                  </h3>

                  <?php if ($venue['address']): ?>
                    <p class="event-location">
                      <?php echo $icon('pin'); ?>
                      <?php echo esc_html($venue['address']); ?>
                    </p>
                  <?php endif; ?>

                  <?php if ($venue['summary']): ?>
                    <p><?php echo esc_html($venue['summary']); ?></p>
                  <?php endif; ?>

                  <a class="event-text-link" href="<?php echo esc_url($venue['url']); ?>">
                    Conhecer a casa →
                  </a>
                </div>
              </article>
            <?php endforeach; ?>
          </div>
        </section>
      <?php endif; ?>
    </div>
  <?php endif; ?>
  <!-- Mapas -->
  <?php if ($has_location): ?>
    <section class="event-section" id="evento-localizacao">
      <h2 class="event-title">Como chegar</h2>

      <div class="event-map-list">
        <?php foreach ($venues as $venue):
          if (!$venue['address'] && !$venue['maps'] && !$venue['embed']) {
            continue;
          }
          ?>
          <div class="event-map<?php echo !$venue['embed'] ? ' event-map--no-frame' : ''; ?>">
            <?php if ($venue['embed']): ?>
              <div class="event-map__frame">
                <iframe
                  src="<?php echo esc_url($venue['embed']); ?>"
                  title="<?php echo esc_attr('Localização de ' . $venue['title']); ?>"
                  loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"
                  allowfullscreen
                ></iframe>
              </div>
            <?php endif; ?>

            <div class="event-map__copy">
              <h3><?php echo esc_html($venue['title']); ?></h3>

              <?php if ($venue['address']): ?>
                <address>
                  <?php echo $icon('pin'); ?>
                  <span><?php echo esc_html($venue['address']); ?></span>
                </address>
              <?php endif; ?>

              <?php if ($venue['maps']): ?>
                <a
                  class="event-button"
                  href="<?php echo esc_url($venue['maps']); ?>"
                  target="_blank"
                  rel="noopener noreferrer"
                >Abrir no Google Maps ↗</a>
              <?php endif; ?>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </section>
  <?php endif; ?>

  <!-- Aviso -->
  <aside class="event-reminder">
    <?php echo $icon('alert'); ?>

    <div>
      <strong><?php echo $is_past ? 'Evento realizado' : 'Antes de sair de casa'; ?></strong>
      <p>
        <?php echo $is_past
          ? 'Confira a agenda para encontrar as próximas rodas.'
          : 'A programação pode mudar. Confirme horários e informações nos canais oficiais.'; ?>
      </p>
    </div>

    <?php if ($contact_url && !$is_past): ?>
      <a
        href="<?php echo esc_url($contact_url); ?>"
        target="_blank"
        rel="noopener noreferrer"
      >Falar com a organização ↗</a>
    <?php else: ?>
      <a href="<?php echo esc_url($agenda_url); ?>">Explorar a agenda →</a>
    <?php endif; ?>
  </aside>

  <!-- Outros eventos -->
  <?php if ($related): ?>
    <section class="event-section" id="evento-relacionados">
      <h2 class="event-title">Mais samba na agenda</h2>

      <div class="event-related">
        <?php foreach ($related as $other):
          $other_title = get_the_title($other);
          $other_date = $parse_date($meta($other->ID, 'evento_data'));

          $other_houses = $relation_ids(
            get_post_meta($other->ID, 'evento_casa', true),
            'casa'
          );

          $other_place = $other_houses
            ? get_the_title($other_houses[0])
            : '';
          ?>
          <article>
            <a href="<?php echo esc_url(get_permalink($other)); ?>">
              <div class="event-related__image">
                <img
                  src="<?php echo esc_url(csamba_image_url(
                    $other->ID,
                    'medium_large',
                    $other_title
                  )); ?>"
                  alt=""
                  loading="lazy"
                  decoding="async"
                >

                <?php if ($other_date): ?>
                  <time
                    class="event-related__date"
                    datetime="<?php echo esc_attr($other_date->format('Y-m-d')); ?>"
                  >
                    <strong><?php echo esc_html($other_date->format('d')); ?></strong>
                    <small><?php echo esc_html(wp_date(
                      'M',
                      $other_date->getTimestamp(),
                      wp_timezone()
                    )); ?></small>
                  </time>
                <?php endif; ?>
              </div>

              <div class="event-related__copy">
                <h3><?php echo esc_html($other_title); ?></h3>

                <?php if ($other_place): ?>
                  <p>
                    <?php echo $icon('pin'); ?>
                    <?php echo esc_html($other_place); ?>
                  </p>
                <?php endif; ?>

                <span>Ver evento →</span>
              </div>
            </a>
          </article>
        <?php endforeach; ?>
      </div>
    </section>
  <?php endif; ?>

</main>

<?php get_footer(); ?>