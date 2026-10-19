<?php
get_header();
the_post();

$band_id = get_the_ID();
$band_title = get_the_title();

$field = static function ($name) use ($band_id) {
  $value = function_exists('get_field')
    ? get_field($name, $band_id)
    : get_post_meta($band_id, $name, true);

  return is_scalar($value) ? trim((string) $value) : '';
};

$bio = $field('banda_bio');
$city = $field('banda_cidade');
$formed = $field('banda_formacao');
$contact_url = esc_url($field('banda_contato_url'));

$bio_html = $bio
  ? wpautop(wp_kses_post($bio))
  : apply_filters('the_content', get_the_content());

$intro = has_excerpt()
  ? get_the_excerpt()
  : wp_trim_words(
      wp_strip_all_tags(strip_shortcodes($bio ?: get_the_content())),
      24
    );

$gallery = array_values(array_filter(
  (array) csamba_band_gallery($band_id),
  static function ($id) {
    return is_numeric($id) && wp_attachment_is_image((int) $id);
  }
));

$tracks = (array) csamba_band_tracks($band_id);
$clips = (array) csamba_band_clips($band_id);

$socials = [];

foreach ([
  'banda_site'      => 'Site',
  'banda_instagram' => 'Instagram',
  'banda_youtube'   => 'YouTube',
  'banda_spotify'   => 'Spotify',
] as $name => $label) {
  $url = esc_url($field($name));

  if ($url) {
    $socials[] = ['label' => $label, 'url' => $url];
  }
}

$band_events = new WP_Query([
  'post_type'      => 'evento',
  'post_status'    => 'publish',
  'posts_per_page' => 6,
  'no_found_rows'  => true,
  'meta_key'      => 'evento_data',
  'orderby'      => 'meta_value_num',
  'order'        => 'ASC',
  'meta_query'   => [
    'relation' => 'AND',
    [
      'relation' => 'OR',
      [
        'key'     => 'evento_banda',
        'value'   => (string) $band_id,
        'compare' => '=',
      ],
      // Também atende ACF Relationship com múltiplas bandas.
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

$related = get_posts([
  'post_type'      => 'banda',
  'post_status'    => 'publish',
  'posts_per_page' => 3,
  'post__not_in'   => [$band_id],
  'orderby'       => 'title',
  'order'         => 'ASC',
]);

$bands_url = get_post_type_archive_link('banda') ?: home_url('/');
$agenda_url = get_post_type_archive_link('evento') ?: home_url('/');

$meta = implode(' · ', array_filter([
  $city,
  $formed ? 'Desde ' . $formed : '',
]));
?>

<main class="container band-single">

  <nav class="band-single__breadcrumb" aria-label="Navegação estrutural">
    <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>
    <span aria-hidden="true">›</span>
    <a href="<?php echo esc_url($bands_url); ?>">Bandas e artistas</a>
    <span aria-hidden="true">›</span>
    <span aria-current="page"><?php echo esc_html($band_title); ?></span>
  </nav>

  <header class="band-single__hero">
    <div class="band-single__portrait">
      <?php if (has_post_thumbnail()): ?>
        <?php the_post_thumbnail('large', [
          'class'         => 'band-single__hero-image',
          'fetchpriority'=> 'high',
          'decoding'     => 'async',
        ]); ?>
      <?php else: ?>
        <img
          class="band-single__hero-image"
          src="<?php echo esc_url(csamba_placeholder($band_title)); ?>"
          alt=""
        >
      <?php endif; ?>
    </div>

    <div class="band-single__profile">
      <a class="band-single__eyebrow" href="<?php echo esc_url($bands_url); ?>">
        Bandas e artistas
      </a>

      <h1><?php echo esc_html($band_title); ?></h1>

      <?php if ($meta): ?>
        <p class="band-single__meta"><?php echo esc_html($meta); ?></p>
      <?php endif; ?>

      <?php if ($intro): ?>
        <p class="band-single__intro"><?php echo esc_html($intro); ?></p>
      <?php endif; ?>

      <div class="band-single__actions">
        <a class="band-single__button" href="#agenda">
          Próximos shows <span aria-hidden="true">↓</span>
        </a>

        <?php if ($contact_url): ?>
          <a
            class="band-single__button band-single__button--outline"
            href="<?php echo esc_url($contact_url); ?>"
            target="_blank"
            rel="noopener noreferrer"
          >
            Contato para shows <span aria-hidden="true">↗</span>
          </a>
        <?php endif; ?>
      </div>

      <?php if ($socials): ?>
        <nav class="band-single__socials" aria-label="Canais oficiais">
          <?php foreach ($socials as $social): ?>
            <a
              href="<?php echo esc_url($social['url']); ?>"
              target="_blank"
              rel="noopener noreferrer"
              aria-label="<?php echo esc_attr(
                $social['label'] . ' de ' . $band_title . ' (abre em nova aba)'
              ); ?>"
            >
              <?php echo esc_html($social['label']); ?>
              <span aria-hidden="true">↗</span>
            </a>
          <?php endforeach; ?>
        </nav>
      <?php endif; ?>
    </div>
  </header>

  <nav class="band-single__nav" aria-label="Nesta página">
    <?php if (trim(wp_strip_all_tags($bio_html))): ?>
      <a href="#sobre">Sobre a banda</a>
    <?php endif; ?>
    <a href="#agenda">Agenda</a>
    <?php if ($gallery): ?><a href="#fotos">Fotos</a><?php endif; ?>
    <?php if ($clips): ?><a href="#clipes">Vídeos</a><?php endif; ?>
    <?php if ($tracks): ?><a href="#musicas">Músicas</a><?php endif; ?>
  </nav>

  <div class="band-single__overview">
    <?php if (trim(wp_strip_all_tags($bio_html))): ?>
      <section class="band-single__panel band-single__about" id="sobre">
        <h2 class="band-single__title">Sobre a banda</h2>
        <div class="band-single__bio">
          <?php echo wp_kses_post($bio_html); ?>
        </div>
      </section>
    <?php endif; ?>

    <aside class="band-single__panel band-single__agenda" id="agenda">
      <h2 class="band-single__title">Próximos shows</h2>

      <?php if ($band_events->have_posts()): ?>
        <div class="band-single__events">
          <?php
          while ($band_events->have_posts()):
            $band_events->the_post();

            $event_id = get_the_ID();

            // ACF armazena Date Picker como Ymd, independentemente
            // do formato de retorno configurado no painel.
            $raw_date = (string) get_post_meta(
              $event_id,
              'evento_data',
              true
            );

            $date = DateTimeImmutable::createFromFormat(
              '!Ymd',
              $raw_date,
              wp_timezone()
            );

            $valid_date = $date && $date->format('Ymd') === $raw_date;

            $time = get_post_meta($event_id, 'evento_hora', true);
            $time = is_scalar($time) ? trim((string) $time) : '';

            if (preg_match('/^\d{2}:\d{2}(:\d{2})?$/', $time)) {
              $time = substr($time, 0, 5);
            }

            $venue = function_exists('get_field')
              ? get_field('evento_casa', $event_id)
              : get_post_meta($event_id, 'evento_casa', true);

            if (is_array($venue)) {
              $venue = $venue ? reset($venue) : null;
            }

            $venue_id = $venue instanceof WP_Post
              ? $venue->ID
              : (is_numeric($venue) ? (int) $venue : 0);

            $details = implode(' · ', array_filter([
              $time,
              $venue_id ? get_the_title($venue_id) : '',
            ]));
            ?>
            <a class="band-single__event" href="<?php the_permalink(); ?>">
              <span class="band-single__event-date" aria-hidden="true">
                <strong>
                  <?php echo $valid_date ? esc_html($date->format('d')) : '—'; ?>
                </strong>
                <small>
                  <?php
                  echo $valid_date
                    ? esc_html(wp_date('M', $date->getTimestamp(), wp_timezone()))
                    : '';
                  ?>
                </small>
              </span>

              <span class="band-single__event-copy">
                <strong><?php the_title(); ?></strong>

                <?php if ($valid_date): ?>
                  <time datetime="<?php echo esc_attr($date->format('Y-m-d')); ?>">
                    <?php echo esc_html($date->format('d/m/Y')); ?>
                  </time>
                <?php endif; ?>

                <?php if ($details): ?>
                  <small><?php echo esc_html($details); ?></small>
                <?php endif; ?>
              </span>

              <span aria-hidden="true">→</span>
            </a>
          <?php endwhile; wp_reset_postdata(); ?>
        </div>
      <?php else: ?>
        <div class="band-single__empty">
          <svg
            width="44" height="44" viewBox="0 0 24 24"
            fill="none" stroke="currentColor" stroke-width="1.5"
            aria-hidden="true"
          >
            <rect x="3" y="5" width="18" height="16" rx="2"/>
            <path d="M16 3v4M8 3v4M3 11h18M8 15h3M13 15h3"/>
          </svg>
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
        Explore a agenda do CSamba <span aria-hidden="true">→</span>
      </a>
    </aside>
  </div>

  <?php if ($gallery): ?>
    <section class="band-single__section" id="fotos">
      <h2 class="band-single__title">A banda em imagens</h2>

      <div class="band-single__gallery">
        <?php foreach ($gallery as $image_id):
          $full_url = wp_get_attachment_image_url($image_id, 'full');
          if (!$full_url) continue;
          ?>
          <a
            href="<?php echo esc_url($full_url); ?>"
            data-band-photo
            aria-label="<?php echo esc_attr('Ampliar foto de ' . $band_title); ?>"
          >
            <?php echo wp_get_attachment_image(
              $image_id,
              'medium_large',
              false,
              ['loading' => 'lazy', 'decoding' => 'async']
            ); ?>
            <span class="band-single__zoom" aria-hidden="true">↗</span>
          </a>
        <?php endforeach; ?>
      </div>
    </section>
  <?php endif; ?>

  <?php if ($clips || $tracks): ?>
    <section class="band-single__section">
      <h2 class="band-single__title">Som e movimento</h2>

      <div class="band-single__media">
        <?php if ($clips): ?>
          <section class="band-single__panel" id="clipes">
            <h3 class="band-single__subtitle">Assista</h3>

            <div class="band-single__clips">
              <?php foreach ($clips as $clip):
                $clip_url = esc_url($clip['url'] ?? '');
                if (!$clip_url) continue;

                $clip_title = !empty($clip['title'])
                  ? $clip['title']
                  : 'Vídeo de ' . $band_title;
                ?>
                <article class="band-single__clip">
                  <a
                    href="<?php echo esc_url($clip_url); ?>"
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label="<?php echo esc_attr(
                      $clip_title . ' (abre em nova aba)'
                    ); ?>"
                  >
                    <div class="band-single__clip-image">
                      <?php if (!empty($clip['thumb'])): ?>
                        <img
                          src="<?php echo esc_url($clip['thumb']); ?>"
                          alt=""
                          loading="lazy"
                          decoding="async"
                        >
                      <?php endif; ?>

                      <span class="band-single__play" aria-hidden="true">▶</span>
                    </div>

                    <h4><?php echo esc_html($clip_title); ?></h4>
                  </a>
                </article>
              <?php endforeach; ?>
            </div>
          </section>
        <?php endif; ?>

        <?php if ($tracks): ?>
          <section class="band-single__panel" id="musicas">
            <h3 class="band-single__subtitle">Ouça a banda</h3>

            <ol class="band-single__tracks">
              <?php foreach ($tracks as $index => $track):
                $track_url = esc_url($track['url'] ?? '');
                $track_title = !empty($track['title'])
                  ? $track['title']
                  : 'Faixa ' . ($index + 1);
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
                    <strong><?php echo esc_html($track_title); ?></strong>

                    <?php if ($track_url): ?>
                      <a
                        href="<?php echo esc_url($track_url); ?>"
                        target="_blank"
                        rel="noopener noreferrer"
                        aria-label="<?php echo esc_attr(
                          'Ouvir ' . $track_title . ' (abre em nova aba)'
                        ); ?>"
                      >
                        Ouvir faixa <span aria-hidden="true">↗</span>
                      </a>
                    <?php endif; ?>
                  </div>
                </li>
              <?php endforeach; ?>
            </ol>
          </section>
        <?php endif; ?>
      </div>
    </section>
  <?php endif; ?>

  <?php if ($contact_url): ?>
    <aside class="band-single__contact">
      <div>
        <h2>Leve esse samba para o seu evento.</h2>
        <p>Fale com a banda e consulte a disponibilidade.</p>
      </div>

      <a
        class="band-single__button"
        href="<?php echo esc_url($contact_url); ?>"
        target="_blank"
        rel="noopener noreferrer"
      >
        Contato para shows <span aria-hidden="true">↗</span>
      </a>
    </aside>
  <?php endif; ?>

  <?php if ($related): ?>
    <section class="band-single__section">
      <h2 class="band-single__title">Mais artistas para conhecer</h2>

      <div class="band-single__related">
        <?php foreach ($related as $artist):
          $artist_title = get_the_title($artist);
          ?>
          <article>
            <a href="<?php echo esc_url(get_permalink($artist)); ?>">
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
                <span aria-hidden="true">→</span>
              </div>
            </a>
          </article>
        <?php endforeach; ?>
      </div>
    </section>
  <?php endif; ?>
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
</main>

<?php get_footer(); ?>