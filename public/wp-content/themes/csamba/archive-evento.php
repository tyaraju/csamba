<?php
if (!defined('ABSPATH')) {
  exit;
}

/* =========================
   HELPERS E FILTROS
   ========================= */

$agenda_meta = static function ($id, $key) {
  $value = get_post_meta($id, $key, true);

  return is_scalar($value) ? trim((string) $value) : '';
};

$agenda_ids = static function ($value) {
  $values = is_array($value) ? $value : [$value];
  $ids = [];

  foreach ($values as $item) {
    if (is_numeric($item) && (int) $item > 0) {
      $ids[] = (int) $item;
    }
  }

  return array_values(array_unique($ids));
};

$agenda_normalize = static function ($value) {
  $value = remove_accents(wp_strip_all_tags((string) $value));

  return function_exists('mb_strtolower')
    ? mb_strtolower($value, 'UTF-8')
    : strtolower($value);
};

$agenda_get = static function ($key) {
  $value = $_GET[$key] ?? '';

  return is_string($value)
    ? sanitize_text_field(wp_unslash($value))
    : '';
};

$agenda_parse_date = static function ($value) {
  $date = DateTimeImmutable::createFromFormat(
    '!Y-m-d',
    $value,
    wp_timezone()
  );

  return $date && $date->format('Y-m-d') === $value
    ? $date
    : false;
};

$agenda_base = get_post_type_archive_link('evento')
  ?: home_url('/agenda/');

$today = new DateTimeImmutable('today', wp_timezone());
$tomorrow = $today->modify('+1 day');

$period = $agenda_get('periodo') ?: 'hoje';
$selected_date = $agenda_parse_date($agenda_get('dia'));
$search = $agenda_get('busca');
$house_filter = absint($agenda_get('casa'));
$city_filter = $agenda_get('cidade');
$order = $agenda_get('ordem') === 'desc' ? 'desc' : 'asc';
$page = max(1, absint($agenda_get('pagina')));

if (!in_array($period, ['hoje', 'amanha', 'fim-semana', 'data'], true)) {
  $period = '';
}

if ($period === 'data' && !$selected_date) {
  $period = '';
}

$start = $today;
$end = $today->modify('+29 days');

$weekday = (int) $today->format('N');

// Fim de semana: sexta a domingo; se já começou, inclui só os dias restantes.
$weekend_start = $weekday >= 5
  ? $today
  : $today->modify('+' . (5 - $weekday) . ' days');

$weekend_end = $weekend_start->modify(
  '+' . (7 - (int) $weekend_start->format('N')) . ' days'
);

switch ($period) {
  case 'hoje':
    $start = $end = $today;
    break;

  case 'amanha':
    $start = $end = $tomorrow;
    break;

  case 'fim-semana':
    $start = $weekend_start;
    $end = $weekend_end;
    break;

  case 'data':
    $start = $end = $selected_date;
    break;
}

$state = array_filter([
  'periodo' => $period,
  'dia'     => $period === 'data' ? $start->format('Y-m-d') : '',
  'busca'   => $search,
  'casa'    => $house_filter ?: '',
  'cidade'  => $city_filter,
  'ordem'   => $order === 'desc' ? 'desc' : '',
], static function ($value) {
  return $value !== '';
});

$agenda_url = static function ($changes = [], $anchor = '') use (
  $agenda_base,
  $state
) {
  $args = array_merge($state, $changes);

  $args = array_filter($args, static function ($value) {
    return $value !== '' && $value !== null;
  });

  return add_query_arg($args, $agenda_base)
    . ($anchor ? '#' . $anchor : '');
};

/* =========================
   CASAS E CIDADES
   ========================= */

$houses = get_posts([
  'post_type'      => 'casa',
  'post_status'    => 'publish',
  'posts_per_page' => -1,
  'orderby'       => 'title',
  'order'         => 'ASC',
]);

$cities = [];

foreach ($houses as $house) {
  $city = $agenda_meta($house->ID, 'casa_cidade');

  if ($city !== '') {
    $cities[$city] = $city;
  }
}

natcasesort($cities);

/* =========================
   EVENTOS DO PERÍODO
   ========================= */

// Filtragem em PHP para combinar título, bandas e metadados das casas.
// Adequada à base inicial do portal.
$candidates = get_posts([
  'post_type'      => 'evento',
  'post_status'    => 'publish',
  'posts_per_page' => -1,
  'meta_key'      => 'evento_data',
  'orderby'       => 'meta_value_num',
  'order'         => 'ASC',
  'meta_query'    => [
    [
      'key'     => 'evento_data',
      'value'   => [$start->format('Ymd'), $end->format('Ymd')],
      'compare' => 'BETWEEN',
      'type'    => 'NUMERIC',
    ],
  ],
]);

$events = [];
$search_normalized = $agenda_normalize($search);

foreach ($candidates as $event) {
  $event_id = $event->ID;
  $raw_date = $agenda_meta($event_id, 'evento_data');

  $date = DateTimeImmutable::createFromFormat(
    '!Ymd',
    $raw_date,
    wp_timezone()
  );

  if (!$date || $date->format('Ymd') !== $raw_date) {
    continue;
  }

  $house_ids = $agenda_ids(
    get_post_meta($event_id, 'evento_casa', true)
  );

  $band_ids = $agenda_ids(
    get_post_meta($event_id, 'evento_banda', true)
  );

  if ($house_filter && !in_array($house_filter, $house_ids, true)) {
    continue;
  }

  $band_names = [];
  $house_names = [];
  $event_cities = [];
  $places = [];

  foreach ($band_ids as $band_id) {
    $name = get_the_title($band_id);

    if ($name) {
      $band_names[] = $name;
    }
  }

  foreach ($house_ids as $venue_id) {
    $name = get_the_title($venue_id);
    $city = $agenda_meta($venue_id, 'casa_cidade');
    $neighborhood = $agenda_meta($venue_id, 'casa_bairro');

    if ($name) {
      $house_names[] = $name;

      $places[] = implode(' · ', array_filter([
        $name,
        $neighborhood ?: $city,
      ]));
    }

    if ($city !== '') {
      $event_cities[] = $city;
    }
  }

  if (
    $city_filter !== ''
    && !in_array($city_filter, $event_cities, true)
  ) {
    continue;
  }

  $title = get_the_title($event_id);

  $searchable = $agenda_normalize(implode(' ', [
    $title,
    implode(' ', $band_names),
    implode(' ', $house_names),
    implode(' ', $places),
    implode(' ', $event_cities),
  ]));

  if (
    $search_normalized !== ''
    && strpos($searchable, $search_normalized) === false
  ) {
    continue;
  }

  $time = $agenda_meta($event_id, 'evento_hora');

  if (preg_match('/^\d{2}:\d{2}(?::\d{2})?$/', $time)) {
    $time = substr($time, 0, 5);
  }

  $time_valid = preg_match('/^(?:[01]\d|2[0-3]):[0-5]\d$/', $time);

  // Usa estes campos somente se existirem no cadastro.
  $price = $agenda_meta($event_id, 'evento_preco');
  $free = $agenda_meta($event_id, 'evento_gratuito') === '1';

  $price_label = $free
    ? 'Entrada gratuita'
    : ($price ?: 'Consulte a casa');

  $events[] = [
    'id'          => $event_id,
    'title'       => $title,
    'date'        => $date,
    'date_key'    => $date->format('Ymd'),
    'time'        => $time,
    'sort_time'   => $time_valid ? $time : '',
    'bands'       => implode(', ', array_unique($band_names)),
    'place'       => implode(' / ', array_unique($places)),
    'price'       => $price_label,
    'image_id'    => has_post_thumbnail($event_id)
      ? $event_id
      : ($house_ids[0] ?? $event_id),
  ];
}

usort($events, static function ($a, $b) use ($order) {
  // Dias sempre em ordem cronológica.
  $date_compare = strcmp($a['date_key'], $b['date_key']);

  if ($date_compare !== 0) {
    return $date_compare;
  }

  // Horários não informados ficam no final.
  if ($a['sort_time'] === '' || $b['sort_time'] === '') {
    if ($a['sort_time'] !== $b['sort_time']) {
      return $a['sort_time'] === '' ? 1 : -1;
    }
  }

  $time_compare = strcmp($a['sort_time'], $b['sort_time']);

  if ($time_compare !== 0) {
    return $order === 'desc' ? -$time_compare : $time_compare;
  }

  return strnatcasecmp($a['title'], $b['title']);
});

$total = count($events);
$per_page = 12;
$total_pages = max(1, (int) ceil($total / $per_page));
$page = min($page, $total_pages);

$visible_events = array_slice(
  $events,
  ($page - 1) * $per_page,
  $per_page
);

$groups = [];

foreach ($visible_events as $event) {
  $groups[$event['date_key']][] = $event;
}

/* =========================
   CALENDÁRIO
   ========================= */

$month_value = $agenda_get('mes');

$calendar_month = $agenda_parse_date(
  preg_match('/^\d{4}-\d{2}$/', $month_value)
    ? $month_value . '-01'
    : ''
);

if (!$calendar_month) {
  $calendar_month = $start->modify('first day of this month');
}

$calendar_days = (int) $calendar_month->format('t');
$calendar_offset = (int) $calendar_month->format('N') - 1;

$rail_value = $agenda_get('semana');
$rail_start = $agenda_parse_date($rail_value) ?: $start;

$register_page = get_page_by_path('cadastrar-evento');

$register_url = $register_page
  && $register_page->post_status === 'publish'
    ? get_permalink($register_page)
    : '';

$day_heading = static function ($date) use ($today, $tomorrow) {
  $prefix = '';

  if ($date->format('Ymd') === $today->format('Ymd')) {
    $prefix = 'Hoje, ';
  } elseif ($date->format('Ymd') === $tomorrow->format('Ymd')) {
    $prefix = 'Amanhã, ';
  }

  return $prefix . wp_date(
    'l · d \d\e F',
    $date->getTimestamp(),
    wp_timezone()
  );
};

get_header();
?>

<main class="container agenda-archive">

  <nav class="agenda-breadcrumb" aria-label="Navegação estrutural">
    <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>
    <span aria-hidden="true">›</span>
    <span aria-current="page">Agenda</span>
  </nav>

  <header class="agenda-heading">
    <div>
      <span class="agenda-eyebrow">Agenda CSamba</span>
      <h1>Encontre sua próxima roda.</h1>
      <p>
        Samba e pagode em Porto Alegre e região.
        Escolha o dia e vem pra roda.
      </p>
    </div>

    <svg
      width="58" height="58" viewBox="0 0 24 24"
      fill="none" stroke="currentColor" stroke-width="1.5"
      aria-hidden="true"
    >
      <rect x="3" y="5" width="18" height="16" rx="2"/>
      <path d="M8 3v4M16 3v4M3 11h18M7 15h2M12 15h2M7 18h2M12 18h2"/>
    </svg>
  </header>

  <!-- Atalhos -->
  <nav class="agenda-shortcuts" aria-label="Escolher período">
    <a
      href="<?php echo esc_url($agenda_url([
        'periodo' => 'hoje',
        'dia' => null,
      ])); ?>"
      <?php if ($period === 'hoje'): ?>aria-current="true"<?php endif; ?>
    >Hoje</a>

    <a
      href="<?php echo esc_url($agenda_url([
        'periodo' => 'amanha',
        'dia' => null,
      ])); ?>"
      <?php if ($period === 'amanha'): ?>aria-current="true"<?php endif; ?>
    >Amanhã</a>

    <a
      href="<?php echo esc_url($agenda_url([
        'periodo' => 'fim-semana',
        'dia' => null,
      ])); ?>"
      <?php if ($period === 'fim-semana'): ?>aria-current="true"<?php endif; ?>
    >Fim de semana</a>

    <a
      href="#agenda-date-picker"
      data-agenda-pick-date
      <?php if ($period === 'data'): ?>aria-current="true"<?php endif; ?>
    >Escolher data</a>

    <?php if ($period !== 'proximos'): ?>
      <a href="<?php echo esc_url($agenda_url([
        'periodo' => 'proximos',
        'dia' => null,
      ])); ?>">
        Próximos 30 dias
      </a>
    <?php endif; ?>
  </nav>

  <!-- Carrossel de dias -->
  <nav class="agenda-days" aria-label="Navegar pelos dias">
    <a
      class="agenda-days__arrow"
      href="<?php echo esc_url($agenda_url([
        'semana' => $rail_start->modify('-7 days')->format('Y-m-d'),
      ])); ?>"
      aria-label="Mostrar sete dias anteriores"
    >‹</a>

    <div class="agenda-days__list">
      <?php for ($i = 0; $i < 7; $i++):
        $day = $rail_start->modify('+' . $i . ' days');
        $active = $start->format('Ymd') === $day->format('Ymd')
          && $start == $end;
        ?>
        <a
          href="<?php echo esc_url($agenda_url([
            'periodo' => 'data',
            'dia' => $day->format('Y-m-d'),
          ])); ?>"
          <?php if ($active): ?>aria-current="date"<?php endif; ?>
        >
          <small><?php echo esc_html(wp_date(
            'D',
            $day->getTimestamp(),
            wp_timezone()
          )); ?></small>
          <strong><?php echo esc_html(wp_date(
            'd M',
            $day->getTimestamp(),
            wp_timezone()
          )); ?></strong>
        </a>
      <?php endfor; ?>
    </div>

    <a
      class="agenda-days__arrow"
      href="<?php echo esc_url($agenda_url([
        'semana' => $rail_start->modify('+7 days')->format('Y-m-d'),
      ])); ?>"
      aria-label="Mostrar próximos sete dias"
    >›</a>
  </nav>

  <!-- Filtros -->
  <form class="agenda-filters" method="get" action="<?php echo esc_url($agenda_base); ?>">
    <?php if ($period): ?>
      <input type="hidden" name="periodo" value="<?php echo esc_attr($period); ?>">
    <?php endif; ?>

    <?php if ($period === 'data'): ?>
      <input type="hidden" name="dia" value="<?php echo esc_attr($start->format('Y-m-d')); ?>">
    <?php endif; ?>

    <?php if ($order === 'desc'): ?>
      <input type="hidden" name="ordem" value="desc">
    <?php endif; ?>

    <div class="agenda-field agenda-field--search">
      <label class="agenda-sr-only" for="agenda-search">
        Buscar evento, artista ou localização
      </label>
      <input
        id="agenda-search"
        name="busca"
        type="search"
        value="<?php echo esc_attr($search); ?>"
        placeholder="Busque um evento ou artista"
      >
    </div>

    <div class="agenda-field">
      <label class="agenda-sr-only" for="agenda-house">Casa</label>
      <select id="agenda-house" name="casa">
        <option value="">Todas as casas</option>
        <?php foreach ($houses as $house): ?>
          <option
            value="<?php echo esc_attr($house->ID); ?>"
            <?php selected($house_filter, $house->ID); ?>
          ><?php echo esc_html(get_the_title($house)); ?></option>
        <?php endforeach; ?>
      </select>
    </div>

    <div class="agenda-field">
      <label class="agenda-sr-only" for="agenda-city">Cidade</label>
      <select id="agenda-city" name="cidade">
        <option value="">Todas as cidades</option>
        <?php foreach ($cities as $city): ?>
          <option
            value="<?php echo esc_attr($city); ?>"
            <?php selected($city_filter, $city); ?>
          ><?php echo esc_html($city); ?></option>
        <?php endforeach; ?>
      </select>
    </div>

    <button class="agenda-button" type="submit">Filtrar</button>

    <a class="agenda-clear" href="<?php echo esc_url($agenda_base); ?>">
      Limpar filtros
    </a>
  </form>

  <div class="agenda-layout">
    <div class="agenda-results" id="agenda-resultados">

      <div class="agenda-results-bar">
        <p>
          <?php echo esc_html(
            $total . ($total === 1 ? ' evento encontrado' : ' eventos encontrados')
          ); ?>
          <span>
            <?php echo esc_html(
              $start->format('d/m')
              . ($start != $end ? ' a ' . $end->format('d/m') : '')
            ); ?>
          </span>
        </p>

        <form method="get" action="<?php echo esc_url($agenda_base); ?>">
          <?php foreach ($state as $key => $value):
            if ($key === 'ordem') {
              continue;
            }
            ?>
            <input
              type="hidden"
              name="<?php echo esc_attr($key); ?>"
              value="<?php echo esc_attr($value); ?>"
            >
          <?php endforeach; ?>

          <label for="agenda-order">Horário:</label>
          <select id="agenda-order" name="ordem">
            <option value="asc" <?php selected($order, 'asc'); ?>>Mais cedo</option>
            <option value="desc" <?php selected($order, 'desc'); ?>>Mais tarde</option>
          </select>
          <button type="submit">Ordenar</button>
        </form>
      </div>

      <?php if ($groups): ?>
        <?php foreach ($groups as $group): ?>
          <section class="agenda-day-group">
            <h2><?php echo esc_html($day_heading($group[0]['date'])); ?></h2>

            <div class="agenda-event-list">
              <?php foreach ($group as $event): ?>
                <article class="agenda-event">
                  <a
                    class="agenda-event__image"
                    href="<?php echo esc_url(get_permalink($event['id'])); ?>"
                    tabindex="-1"
                    aria-hidden="true"
                  >
                    <img
                      src="<?php echo esc_url(csamba_image_url(
                        $event['image_id'],
                        'medium_large',
                        $event['title']
                      )); ?>"
                      alt=""
                      loading="lazy"
                      decoding="async"
                    >
                  </a>

                  <div class="agenda-event__body">
                    <span class="agenda-event__time">
                      <?php echo esc_html($event['time'] ?: 'Horário a confirmar'); ?>
                    </span>

                    <h3>
                      <a href="<?php echo esc_url(get_permalink($event['id'])); ?>">
                        <?php echo esc_html($event['title']); ?>
                      </a>
                    </h3>

                    <?php if ($event['bands']): ?>
                      <p class="agenda-event__bands">
                        <?php echo esc_html($event['bands']); ?>
                      </p>
                    <?php endif; ?>

                    <p class="agenda-event__place">
                      <svg width="15" height="17" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="1.8"
                        aria-hidden="true">
                        <path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 1 1 16 0Z"/>
                        <circle cx="12" cy="10" r="2.5"/>
                      </svg>
                      <?php echo esc_html(
                        $event['place'] ?: 'Local a confirmar'
                      ); ?>
                    </p>

                    <div class="agenda-event__footer">
                      <span><?php echo esc_html($event['price']); ?></span>
                      <a href="<?php echo esc_url(get_permalink($event['id'])); ?>">
                        Ver evento <span aria-hidden="true">→</span>
                      </a>
                    </div>
                  </div>
                </article>
              <?php endforeach; ?>
            </div>
          </section>
        <?php endforeach; ?>

        <?php if ($total_pages > 1): ?>
          <nav class="agenda-pagination" aria-label="Páginas de eventos">
            <?php if ($page > 1): ?>
              <a href="<?php echo esc_url($agenda_url([
                'pagina' => $page - 1,
              ], 'agenda-resultados')); ?>">← Anterior</a>
            <?php endif; ?>

            <span>
              <?php echo esc_html('Página ' . $page . ' de ' . $total_pages); ?>
            </span>

            <?php if ($page < $total_pages): ?>
              <a href="<?php echo esc_url($agenda_url([
                'pagina' => $page + 1,
              ], 'agenda-resultados')); ?>">Próxima →</a>
            <?php endif; ?>
          </nav>
        <?php endif; ?>

      <?php else: ?>
        <div class="agenda-empty">
          <span class="agenda-eyebrow">A roda continua</span>
          <h2>Nenhum evento encontrado por aqui.</h2>
          <p>Tente outra data, casa ou cidade para encontrar sua próxima roda.</p>
          <a class="agenda-button" href="<?php echo esc_url($agenda_base); ?>">
            Ver próximos eventos
          </a>
        </div>
      <?php endif; ?>
    </div>

    <!-- Lateral -->
    <aside class="agenda-sidebar" aria-label="Calendário e divulgação">
      <section class="agenda-calendar" id="agenda-date-picker">
        <h2>Escolha no calendário</h2>

        <div class="agenda-calendar__heading">
          <a
            href="<?php echo esc_url($agenda_url([
              'mes' => $calendar_month->modify('-1 month')->format('Y-m'),
            ], 'agenda-date-picker')); ?>"
            aria-label="Mês anterior"
          >‹</a>

          <strong><?php echo esc_html(wp_date(
            'F \d\e Y',
            $calendar_month->getTimestamp(),
            wp_timezone()
          )); ?></strong>

          <a
            href="<?php echo esc_url($agenda_url([
              'mes' => $calendar_month->modify('+1 month')->format('Y-m'),
            ], 'agenda-date-picker')); ?>"
            aria-label="Próximo mês"
          >›</a>
        </div>

        <table>
          <caption class="agenda-sr-only">
            <?php echo esc_html(wp_date(
              'F \d\e Y',
              $calendar_month->getTimestamp(),
              wp_timezone()
            )); ?>
          </caption>
          <thead>
            <tr>
              <?php foreach (['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'] as $label): ?>
                <th scope="col"><?php echo esc_html($label); ?></th>
              <?php endforeach; ?>
            </tr>
          </thead>
          <tbody>
            <?php
            $cells = (int) ceil(
              ($calendar_offset + $calendar_days) / 7
            ) * 7;

            for ($cell = 0; $cell < $cells; $cell++):
              if ($cell % 7 === 0) {
                echo '<tr>';
              }

              $number = $cell - $calendar_offset + 1;

              if ($number < 1 || $number > $calendar_days):
                ?>
                <td></td>
              <?php else:
                $day = $calendar_month->setDate(
                  (int) $calendar_month->format('Y'),
                  (int) $calendar_month->format('m'),
                  $number
                );

                $is_today = $day->format('Ymd') === $today->format('Ymd');
                $is_selected = $start == $end
                  && $day->format('Ymd') === $start->format('Ymd');
                ?>
                <td>
                  <a
                    class="<?php echo esc_attr(
                      ($is_today ? 'is-today ' : '')
                      . ($is_selected ? 'is-selected' : '')
                    ); ?>"
                    href="<?php echo esc_url($agenda_url([
                      'periodo' => 'data',
                      'dia' => $day->format('Y-m-d'),
                      'mes' => $calendar_month->format('Y-m'),
                    ], 'agenda-resultados')); ?>"
                    aria-label="<?php echo esc_attr(wp_date(
                      'l, d \d\e F \d\e Y',
                      $day->getTimestamp(),
                      wp_timezone()
                    )); ?>"
                    <?php if ($is_today): ?>aria-current="date"<?php endif; ?>
                  ><?php echo esc_html($number); ?></a>
                </td>
              <?php endif;

              if ($cell % 7 === 6) {
                echo '</tr>';
              }
            endfor;
            ?>
          </tbody>
        </table>

        <form class="agenda-date-form" method="get" action="<?php echo esc_url($agenda_base); ?>">
          <?php foreach ($state as $key => $value):
            if (in_array($key, ['periodo', 'dia'], true)) {
              continue;
            }
            ?>
            <input
              type="hidden"
              name="<?php echo esc_attr($key); ?>"
              value="<?php echo esc_attr($value); ?>"
            >
          <?php endforeach; ?>

          <input type="hidden" name="periodo" value="data">

          <label class="agenda-sr-only" for="agenda-custom-date">
            Escolher uma data
          </label>

          <input
            id="agenda-custom-date"
            name="dia"
            type="date"
            value="<?php echo esc_attr($start->format('Y-m-d')); ?>"
            required
          >

          <button type="submit">Ver dia</button>
        </form>
      </section>

      <section class="agenda-promote">
        <h2>Organiza uma roda?</h2>
        <p>Divulgue sua programação no CSamba.</p>

        <?php if ($register_url): ?>
          <a href="<?php echo esc_url($register_url); ?>">
            Cadastrar evento
            <span aria-hidden="true">→</span>
          </a>
        <?php else: ?>
          <span class="agenda-promote__soon">
            Cadastro de eventos em breve
          </span>
        <?php endif; ?>
      </section>
    </aside>
  </div>

  <p class="agenda-notice">
    A programação pode mudar. Confirme os detalhes com a organização.
  </p>

</main>

<?php get_footer(); ?>