<?php
$house_initial = static function ($title) {
  $title = trim(remove_accents(wp_strip_all_tags($title)));
  $letter = strtoupper(substr($title, 0, 1));

  return preg_match('/^[A-Z]$/', $letter) ? $letter : '#';
};

get_header();

$houses = get_posts([
  'post_type'      => 'casa',
  'post_status'    => 'publish',
  'posts_per_page' => -1,
  'orderby'       => 'title',
  'order'         => 'ASC',
]);

$meta_text = static function ($id, $key) {
  $value = get_post_meta($id, $key, true);
  return is_scalar($value) ? trim((string) $value) : '';
};

$summary = static function ($house, $words = 22) use ($meta_text) {
  $description = $meta_text($house->ID, 'casa_descricao');

  $text = $house->post_excerpt
    ?: ($description ?: $house->post_content);

  return wp_trim_words(
    wp_strip_all_tags(strip_shortcodes($text)),
    $words
  );
};

$location = static function ($id) use ($meta_text) {
  $neighborhood = $meta_text($id, 'casa_bairro');
  $city = $meta_text($id, 'casa_cidade');
  $state = $meta_text($id, 'casa_estado');

  $city_state = implode(' / ', array_filter([$city, $state]));

  return implode(' · ', array_filter([$neighborhood, $city_state]));
};

$featured = array_values(array_filter(
  $houses,
  static function ($house) {
    return get_post_meta($house->ID, 'casa_destaque', true) === '1';
  }
));

usort($featured, static function ($a, $b) use ($meta_text) {
  $a_order = $meta_text($a->ID, 'casa_destaque_ordem');
  $b_order = $meta_text($b->ID, 'casa_destaque_ordem');

  $a_order = is_numeric($a_order) ? (int) $a_order : PHP_INT_MAX;
  $b_order = is_numeric($b_order) ? (int) $b_order : PHP_INT_MAX;

  return ($a_order <=> $b_order)
    ?: strnatcasecmp(
      remove_accents(get_the_title($a)),
      remove_accents(get_the_title($b))
    );
});

$types = [
  'bar'            => 'Bar',
  'casa_de_shows'  => 'Casa de shows',
  'restaurante'    => 'Restaurante',
  'clube'          => 'Clube',
  'centro_cultural'=> 'Centro cultural',
  'outro'          => 'Outro',
];

// Só mostra a chamada quando essa página existir.
// Ajusta o slug se teu cadastro usar outro endereço.
$register_page = get_page_by_path('cadastrar-casa');
$register_url = $register_page
  && $register_page->post_status === 'publish'
    ? get_permalink($register_page)
    : '';

$total = count($houses);

$house_letters = [];

foreach ($houses as $house) {
  $house_letters[$house_initial(get_the_title($house))] = true;
}
?>

<main class="container houses-archive">
  <nav class="houses-breadcrumb" aria-label="Navegação estrutural">
    <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>
    <span aria-hidden="true">›</span>
    <span aria-current="page">Casas de samba</span>
  </nav>

  <header class="houses-heading">
    <h1>Casas de samba</h1>
    <p>Encontre seu lugar para curtir um bom samba em Porto Alegre.</p>
  </header>

  <?php if ($featured): ?>
    <section
      class="houses-featured"
      aria-label="Casas em destaque"
      <?php if (count($featured) > 1): ?>
        aria-roledescription="carrossel"
      <?php endif; ?>
    >
      <?php foreach ($featured as $index => $house):
        $title = get_the_title($house);
        $url = get_permalink($house);
        $description = $summary($house, 28);
        $place = $location($house->ID);
        ?>
        <article
          class="houses-featured__slide"
          id="house-featured-<?php echo esc_attr($index); ?>"
          aria-label="<?php echo esc_attr(
            ($index + 1) . ' de ' . count($featured) . ': ' . $title
          ); ?>"
          <?php if ($index > 0): ?>hidden<?php endif; ?>
        >
          <a
            class="houses-featured__image"
            href="<?php echo esc_url($url); ?>"
            tabindex="-1"
            aria-hidden="true"
          >
            <img
              src="<?php echo esc_url(
                csamba_image_url($house->ID, 'large', $title)
              ); ?>"
              alt=""
              decoding="async"
              <?php if ($index === 0): ?>
                fetchpriority="high"
              <?php else: ?>
                loading="lazy"
              <?php endif; ?>
            >
          </a>

          <div class="houses-featured__copy">
            <span class="houses-featured__badge">Casa em destaque</span>

            <h2>
              <a href="<?php echo esc_url($url); ?>">
                <?php echo esc_html($title); ?>
              </a>
            </h2>

            <?php if ($place): ?>
              <span class="houses-location">
                <?php echo esc_html($place); ?>
              </span>
            <?php endif; ?>

            <?php if ($description): ?>
              <p><?php echo esc_html($description); ?></p>
            <?php endif; ?>

            <a class="houses-button" href="<?php echo esc_url($url); ?>">
              Conheça a casa <span aria-hidden="true">→</span>
            </a>
          </div>
        </article>
      <?php endforeach; ?>

      <?php if (count($featured) > 1): ?>
        <div class="houses-featured__controls" hidden>
          <button type="button" data-house-prev aria-label="Casa anterior">
            ←
          </button>

          <div class="houses-featured__dots">
            <?php foreach ($featured as $index => $house): ?>
              <button
                type="button"
                data-house-slide="<?php echo esc_attr($index); ?>"
                aria-label="<?php echo esc_attr(
                  'Mostrar ' . get_the_title($house)
                ); ?>"
                aria-controls="house-featured-<?php echo esc_attr($index); ?>"
                <?php if ($index === 0): ?>aria-current="true"<?php endif; ?>
              ></button>
            <?php endforeach; ?>
          </div>

          <button type="button" data-house-next aria-label="Próxima casa">
            →
          </button>
        </div>

        <p class="houses-sr-only" data-house-status aria-live="polite"></p>
      <?php endif; ?>
    </section>
  <?php endif; ?>

  <section class="houses-catalog" aria-labelledby="houses-catalog-title">
    <header class="houses-catalog__header">
      <h2 id="houses-catalog-title">Onde o samba acontece</h2>
      <p data-house-count aria-live="polite" aria-atomic="true">
        <?php echo esc_html(
          $total . ($total === 1 ? ' casa para conhecer' : ' casas para conhecer')
        ); ?>
      </p>
    </header>

    <?php if ($houses): ?>
      <div class="houses-toolbar">
        <form
          class="houses-search"
          role="search"
          method="get"
          action="<?php echo esc_url(home_url('/')); ?>"
        >
          <label class="houses-sr-only" for="house-search">
            Buscar casas por nome ou localização
          </label>

          <div class="houses-search__field">
            <svg
              width="20" height="20" viewBox="0 0 24 24"
              fill="none" stroke="currentColor" stroke-width="1.8"
              aria-hidden="true"
            >
              <circle cx="10.5" cy="10.5" r="6.5"/>
              <path d="m16 16 4.5 4.5"/>
            </svg>

            <input
              id="house-search"
              name="s"
              type="search"
              placeholder="Busque pelo nome, bairro ou cidade..."
            >
          </div>

          <input type="hidden" name="post_type" value="casa">
          <button class="houses-button" type="submit">Buscar</button>
        </form>

        <div class="houses-sort" hidden>
          <label for="house-order">Ordem:</label>
          <select id="house-order">
            <option value="asc">A–Z</option>
            <option value="desc">Z–A</option>
          </select>
        </div>
      </div>
      <div class="houses-alphabet" aria-label="Filtrar casas por inicial" hidden>
        <button type="button" data-house-letter="all" aria-pressed="true">
          Todas
        </button>

        <?php
        $alphabet = range('A', 'Z');

        if (isset($house_letters['#'])) {
          $alphabet[] = '#';
        }

        foreach ($alphabet as $letter):
          ?>
          <button
            type="button"
            data-house-letter="<?php echo esc_attr($letter); ?>"
            aria-pressed="false"
            <?php disabled(!isset($house_letters[$letter])); ?>
          >
            <?php echo esc_html($letter); ?>
          </button>
        <?php endforeach; ?>
      </div>
      <div class="houses-grid">
        <?php foreach ($houses as $house):
          $title = get_the_title($house);
          $place = $location($house->ID);
          $description = $summary($house);
          $maps = esc_url($meta_text($house->ID, 'casa_maps'));
          $type = $types[$meta_text($house->ID, 'casa_tipo')] ?? '';

          $search_text = implode(' ', [
            $title,
            $meta_text($house->ID, 'casa_bairro'),
            $meta_text($house->ID, 'casa_cidade'),
            $meta_text($house->ID, 'casa_estado'),
          ]);
          ?>
          <article
            class="house-card"
            data-house-name="<?php echo esc_attr($title); ?>"
            data-house-search="<?php echo esc_attr($search_text); ?>"
            data-house-initial="<?php echo esc_attr($house_initial($title)); ?>"
          >
            <a
              class="house-card__image"
              href="<?php echo esc_url(get_permalink($house)); ?>"
              tabindex="-1"
              aria-hidden="true"
            >
              <img
                src="<?php echo esc_url(
                  csamba_image_url($house->ID, 'medium_large', $title)
                ); ?>"
                alt=""
                loading="lazy"
                decoding="async"
              >
              <?php if ($type): ?>
                <span class="house-card__type">
                  <?php echo esc_html($type); ?>
                </span>
              <?php endif; ?>
            </a>

            <div class="house-card__body">
              <h3>
                <a href="<?php echo esc_url(get_permalink($house)); ?>">
                  <?php echo esc_html($title); ?>
                </a>
              </h3>

              <?php if ($place): ?>
                <p class="houses-location">
                  <svg
                    width="16" height="18" viewBox="0 0 24 24"
                    fill="none" stroke="currentColor" stroke-width="1.8"
                    aria-hidden="true"
                  >
                    <path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 1 1 16 0Z"/>
                    <circle cx="12" cy="10" r="2.5"/>
                  </svg>
                  <?php echo esc_html($place); ?>
                </p>
              <?php endif; ?>

              <?php if ($description): ?>
                <p class="house-card__description">
                  <?php echo esc_html($description); ?>
                </p>
              <?php endif; ?>

              <div class="house-card__actions">
                <a href="<?php echo esc_url(get_permalink($house)); ?>">
                  Conhecer a casa <span aria-hidden="true">→</span>
                </a>

                <?php if ($maps): ?>
                  <a
                    class="house-card__map"
                    href="<?php echo esc_url($maps); ?>"
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label="<?php echo esc_attr(
                      'Ver ' . $title . ' no Google Maps (nova aba)'
                    ); ?>"
                  >
                    Mapa <span aria-hidden="true">↗</span>
                  </a>
                <?php endif; ?>
              </div>
            </div>
          </article>
        <?php endforeach; ?>
      </div>

      <div class="houses-empty" data-house-empty hidden>
        <h3>Nenhuma casa encontrada</h3>
        <p>Tente outro nome, bairro, cidade ou inicial.</p>
        <button class="houses-button" type="button" data-house-reset>
          Limpar filtros
        </button>
      </div>

    <?php else: ?>
      <div class="houses-empty">
        <h3>Essa roda está começando.</h3>
        <p>Em breve, novas casas de samba para conhecer.</p>
      </div>
    <?php endif; ?>
  </section>

  <?php if ($register_url): ?>
    <aside class="houses-register">
      <div>
        <h2>Sua casa também faz parte dessa roda.</h2>
        <p>
          Cadastre seu espaço e conecte sua programação ao público do CSamba.
        </p>
      </div>
      <a
        class="houses-button houses-button--green"
        href="<?php echo esc_url($register_url); ?>"
      >
        Cadastrar casa <span aria-hidden="true">→</span>
      </a>
    </aside>
  <?php endif; ?>
</main>

<?php get_footer(); ?>