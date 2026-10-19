<?php
get_header();

$bands = get_posts([
  'post_type'      => 'banda',
  'post_status'   => 'publish',
  'posts_per_page'=> -1,
  'orderby'       => 'title',
  'order'         => 'ASC',
]);

$featured = get_posts([
  'post_type'       => 'banda',
  'post_status'     => 'publish',
  'posts_per_page'  => -1,
  'meta_query'      => [
    [
      'key'     => 'csamba_destaque',
      'value'   => '1',
      'compare' => '=',
    ],
  ],
  'orderby' => 'title',
  'order'   => 'ASC',
]);

// A ordem vazia vai para o final; empates mantêm a ordem alfabética.
usort($featured, static function ($a, $b) {
  $a_order = get_post_meta($a->ID, 'csamba_destaque_ordem', true);
  $b_order = get_post_meta($b->ID, 'csamba_destaque_ordem', true);

  $a_order = is_numeric($a_order) ? (int) $a_order : PHP_INT_MAX;
  $b_order = is_numeric($b_order) ? (int) $b_order : PHP_INT_MAX;

  return ($a_order <=> $b_order)
    ?: strnatcasecmp(
      remove_accents(get_the_title($a)),
      remove_accents(get_the_title($b))
    );
});

$normalize = static function ($text) {
  return strtolower(remove_accents(wp_strip_all_tags($text)));
};

$available_letters = [];

foreach ($bands as $band) {
  $normalized = $normalize(get_the_title($band));
  $letter = strtoupper(substr(trim($normalized), 0, 1));

  if (!preg_match('/^[A-Z]$/', $letter)) {
    $letter = '#';
  }

  $available_letters[$letter] = true;
}

$total = count($bands);

// Ajusta este slug caso tua página de cadastro use outro endereço.
$register_url = home_url('/cadastrar-banda/');
?>

<main class="container bands-archive">

  <nav class="bands-breadcrumb" aria-label="Navegação estrutural">
    <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>
    <span aria-hidden="true">›</span>
    <span aria-current="page">Bandas e artistas</span>
  </nav>

  <header class="bands-heading">
    <h1>Bandas e artistas</h1>
    <p>Conheça quem faz o samba acontecer em Porto Alegre.</p>
  </header>

  <?php if ($featured): ?>
    <section
      class="bands-featured"
      aria-label="Artistas em destaque"
      <?php if (count($featured) > 1): ?>
        aria-roledescription="carrossel"
      <?php endif; ?>
    >
      <div class="bands-featured__slides">
        <?php foreach ($featured as $index => $band):
          $title = get_the_title($band);
          $url = get_permalink($band);

          $summary = has_excerpt($band)
            ? get_the_excerpt($band)
            : strip_shortcodes($band->post_content);

          $summary = wp_trim_words(
            wp_strip_all_tags($summary),
            28
          );
          ?>
          <article
            class="bands-featured__slide"
            id="bands-featured-<?php echo esc_attr($index); ?>"
            aria-label="<?php echo esc_attr(
              ($index + 1) . ' de ' . count($featured) . ': ' . $title
            ); ?>"
            <?php if ($index > 0): ?>hidden<?php endif; ?>
          >
            <a
              class="bands-featured__image"
              href="<?php echo esc_url($url); ?>"
              tabindex="-1"
              aria-hidden="true"
            >
              <img
                src="<?php echo esc_url(
                  csamba_image_url($band->ID, 'large', $title)
                ); ?>"
                alt=""
                <?php if ($index === 0): ?>
                  fetchpriority="high"
                <?php else: ?>
                  loading="lazy"
                <?php endif; ?>
                decoding="async"
              >
            </a>

            <div class="bands-featured__copy">
              <span class="bands-featured__badge">Em destaque</span>

              <h2>
                <a href="<?php echo esc_url($url); ?>">
                  <?php echo esc_html($title); ?>
                </a>
              </h2>

              <?php if ($summary): ?>
                <p><?php echo esc_html($summary); ?></p>
              <?php endif; ?>

              <a
                class="bands-button bands-button--blue"
                href="<?php echo esc_url($url); ?>"
              >
                Conheça o artista <span aria-hidden="true">→</span>
              </a>
            </div>
          </article>
        <?php endforeach; ?>
      </div>

      <?php if (count($featured) > 1): ?>
        <div class="bands-featured__controls" hidden>
          <button
            type="button"
            class="bands-featured__arrow"
            data-featured-prev
            aria-label="Artista anterior"
          >←</button>

          <div class="bands-featured__dots">
            <?php foreach ($featured as $index => $band): ?>
              <button
                type="button"
                class="bands-featured__dot"
                data-featured-index="<?php echo esc_attr($index); ?>"
                aria-controls="bands-featured-<?php echo esc_attr($index); ?>"
                aria-label="<?php echo esc_attr(
                  'Mostrar ' . get_the_title($band)
                ); ?>"
                <?php if ($index === 0): ?>aria-current="true"<?php endif; ?>
              ></button>
            <?php endforeach; ?>
          </div>

          <button
            type="button"
            class="bands-featured__arrow"
            data-featured-next
            aria-label="Próximo artista"
          >→</button>
        </div>

        <p
          class="bands-sr-only"
          data-featured-status
          aria-live="polite"
          aria-atomic="true"
        ></p>
      <?php endif; ?>
    </section>
  <?php endif; ?>

  <section class="bands-catalog" aria-labelledby="bands-catalog-title">
    <div class="bands-catalog__header">
      <div>
        <h2 id="bands-catalog-title">Encontre seu próximo samba</h2>

        <p
          class="bands-catalog__count"
          data-bands-count
          aria-live="polite"
          aria-atomic="true"
        >
          <?php echo esc_html(
            sprintf(
              _n('%s artista cadastrado', '%s artistas cadastrados', $total, 'csamba'),
              number_format_i18n($total)
            )
          ); ?>
        </p>
      </div>

      <form
        class="bands-search"
        role="search"
        method="get"
        action="<?php echo esc_url(home_url('/')); ?>"
      >
        <label class="bands-sr-only" for="bands-search">
          Buscar bandas e artistas
        </label>

        <div class="bands-search__field">
          <svg
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="1.8"
            aria-hidden="true"
          >
            <circle cx="10.5" cy="10.5" r="6.5"/>
            <path d="m16 16 4.5 4.5"/>
          </svg>

          <input
            type="search"
            id="bands-search"
            name="s"
            placeholder="Qual banda ou artista você procura?"
            autocomplete="off"
          >
        </div>

        <input type="hidden" name="post_type" value="banda">

        <button class="bands-button bands-button--blue" type="submit">
          Buscar
        </button>
      </form>
    </div>

    <?php if ($bands): ?>
      <div class="bands-alphabet" aria-label="Filtrar por inicial" hidden>
        <button
          type="button"
          data-letter="all"
          aria-pressed="true"
        >Todos</button>

        <?php
        $alphabet = range('A', 'Z');

        if (isset($available_letters['#'])) {
          $alphabet[] = '#';
        }

        foreach ($alphabet as $letter):
          ?>
          <button
            type="button"
            data-letter="<?php echo esc_attr($letter); ?>"
            aria-pressed="false"
            <?php disabled(!isset($available_letters[$letter])); ?>
          >
            <?php echo esc_html($letter); ?>
          </button>
        <?php endforeach; ?>
      </div>

      <div class="bands-grid">
        <?php foreach ($bands as $band):
          $title = get_the_title($band);
          $normalized = $normalize($title);
          $letter = strtoupper(substr(trim($normalized), 0, 1));

          if (!preg_match('/^[A-Z]$/', $letter)) {
            $letter = '#';
          }

          // Campo opcional: só aparece quando estiver preenchido.
          $city = get_post_meta($band->ID, 'csamba_banda_cidade', true);
          $city = is_string($city) ? $city : '';
          ?>
          <article
            class="bands-card"
            data-band-name="<?php echo esc_attr($normalized); ?>"
            data-band-letter="<?php echo esc_attr($letter); ?>"
          >
            <a
              class="bands-card__link"
              href="<?php echo esc_url(get_permalink($band)); ?>"
            >
              <div class="bands-card__image">
                <img
                  src="<?php echo esc_url(
                    csamba_image_url($band->ID, 'medium_large', $title)
                  ); ?>"
                  alt=""
                  loading="lazy"
                  decoding="async"
                >
              </div>

              <div class="bands-card__body">
                <h3><?php echo esc_html($title); ?></h3>

                <?php if ($city): ?>
                  <p><?php echo esc_html($city); ?></p>
                <?php endif; ?>

                <span class="bands-card__cta">
                  Conhecer artista <span aria-hidden="true">→</span>
                </span>
              </div>
            </a>
          </article>
        <?php endforeach; ?>
      </div>

      <div class="bands-empty" data-bands-empty hidden>
        <h3>Nenhum artista encontrado</h3>
        <p>Tente outro nome ou escolha uma inicial diferente.</p>
        <button
          type="button"
          class="bands-button bands-button--blue"
          data-bands-reset
        >
          Limpar filtros
        </button>
      </div>

    <?php else: ?>
      <div class="bands-empty">
        <h3>O próximo samba pode ser o seu.</h3>
        <p>Seja o primeiro a cadastrar sua banda ou trabalho solo.</p>
      </div>
    <?php endif; ?>
  </section>

  <aside class="bands-register" aria-labelledby="bands-register-title">
    <div class="bands-register__copy">
      <h2 id="bands-register-title">
        Seu samba também tem espaço aqui.
      </h2>
      <p>Cadastre sua banda ou seu trabalho solo no CSamba.</p>
    </div>

    <a
      class="bands-button bands-button--yellow"
      href="<?php echo esc_url($register_url); ?>"
    >
      Cadastrar artista <span aria-hidden="true">→</span>
    </a>
  </aside>

</main>

<?php get_footer(); ?>