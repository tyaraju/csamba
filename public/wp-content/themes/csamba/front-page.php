<?php get_header(); ?>
<?php
$featured = csamba_featured_items(7);
$houses = get_posts(['post_type'=>'casa','posts_per_page'=>4]);
$news = get_posts(['post_type'=>'post','posts_per_page'=>5]);
$bands = get_posts(['post_type'=>'banda','posts_per_page'=>3]);
$columns = get_posts([
    'post_type'=>'coluna',
    'post_status'=>'publish',
    'posts_per_page'=>3,
    'orderby'=>'date',
    'order'=>'DESC'
]);
$event_query = csamba_upcoming_events(6);

$house_search_query = new WP_Query([
  'post_type'      => 'casa',
  'post_status'    => 'publish',
  'posts_per_page' => -1,
  'orderby'        => 'title',
  'order'          => 'ASC',
]);

$house_search_items = [];

if ($house_search_query->have_posts()) {
  while ($house_search_query->have_posts()) {
    $house_search_query->the_post();

    $house_search_items[] = [
      'title' => get_the_title(),
      'url'   => get_permalink(),
    ];
  }
}

wp_reset_postdata();
?>
<div class="container home-layout">
  <section class="featured-shell" aria-label="Destaques">
    <div class="swiper csamba-featured-swiper">
      <div class="swiper-wrapper">
        <?php if ($featured): foreach ($featured as $featured_post):
          $slide = csamba_featured_data($featured_post);
          if (!$slide) continue;
        ?>
          <article class="swiper-slide featured-slide" data-label="<?php echo esc_attr($slide['title']); ?>" data-color="<?php echo esc_attr($slide['color']); ?>" data-type="<?php echo esc_attr($slide['type']); ?>">
            <div class="featured-media"><img loading="eager" src="<?php echo esc_url($slide['image']); ?>" alt="<?php echo esc_attr($slide['title']); ?>"></div>
            <div class="featured-copy" style="
                --featured-color: <?php echo esc_attr($slide['color']); ?>;
                background: <?php echo esc_attr($slide['background']); ?>;
              ">
              <h1><?php echo esc_html($slide['title']); ?></h1>
              <?php if ($slide['subtitle']): ?><h2><?php echo esc_html($slide['subtitle']); ?></h2><?php endif; ?>
              <?php if ($slide['descricao']): ?><p><?php echo esc_html($slide['descricao']); ?></p><?php endif; ?>
              <a class="button button-light" href="<?php echo esc_url($slide['url']); ?>"><?php echo esc_html($slide['cta']); ?></a>
            </div>
          </article>
        <?php endforeach; else: ?>
          <article class="swiper-slide featured-slide" data-label="CSamba" data-color="#2878d7">
            <div class="featured-media"><img src="<?php echo esc_url(csamba_placeholder('Banda em destaque')); ?>" alt=""></div>
            <div class="featured-copy"><span class="eyebrow">EM DESTAQUE</span><h1>CSamba</h1><p>Cadastre bandas no WordPress e marque-as como destaque.</p></div>
          </article>
        <?php endif; ?>
      </div>
    </div>
    <aside class="featured-tabs" aria-label="Outros destaques">
      <div class="featured-tabs-title">OUTROS <strong>DESTAQUES</strong></div>
      <div class="featured-tabs-subtitle">Navegue abaixo para acessar os nossos destaques</div>
      <div class="featured-pagination"></div>
    </aside>
  </section>
  <!-- /* SEGUNDA DOBRA */ -->
  <section class="home-duo">
    <?php
      /*
      * CASAS DE SAMBA E PAGODE
      *
      * Utiliza o array $houses existente.
      * Exibe uma casa principal e até três miniaturas.
      */

      $featured_houses = array_slice($houses ?? [], 0, 4);

      $house_cards = [];

      foreach ($featured_houses as $house) {

        $id = $house->ID;

        $description = function_exists('get_field')
          ? get_field('casa_descricao', $id)
          : '';

        if (empty($description)) {
          $description = $house->post_content;
        }

        $description = wp_trim_words(
          wp_strip_all_tags((string) $description),
          28,
          '…'
        );

        $neighborhood = function_exists('get_field') ? get_field('casa_bairro', $id) : '';
        $neighborhood = is_scalar($neighborhood) ? trim((string) $neighborhood) : '';

        $house_cards[] = [
          'id' => $id,
          'title' => get_the_title($id),
          'description' => $description,
          'neighborhood' => $neighborhood,
          'url' => get_permalink($id),
          'image' => csamba_image_url(
            $id,
            'csamba-card',
            'Casa de samba'
          ),
        ];
      }

      $main_house = $house_cards[0] ?? null;
    ?>
    <div class="section-block houses">
      <div class="section-heading-row">
        <header class="section-heading">
          <p>CASAS</p>
          <h2>DE SAMBA E PAGODE</h2>
        </header>
        <a class="button" href="<?php echo esc_url(home_url('/casas/')); ?>">Ver todas
        </a>
      </div>
      <div class="houses-showcase">
        <?php if ($main_house): ?>
          <!-- CASA PRINCIPAL -->
          <article class="houses-featured hover-image">
            <a class="houses-featured-image" id="houses-featured-image" href="<?php echo esc_url($main_house['url']); ?>">
              <img id="houses-featured-img" src="<?php echo esc_url($main_house['image']); ?>" alt="<?php echo esc_attr($main_house['title']); ?>">
            </a>
            <div class="houses-featured-copy">
              <h3 id="houses-featured-title">
                <a id="houses-featured-link" class="" href="<?php echo esc_url($main_house['url']); ?>">
                  <?php echo esc_html($main_house['title']); ?>
                </a>
              </h3>
              <p id="houses-featured-description">
                <?php echo esc_html($main_house['description']); ?>
              </p>
              <a id="houses-featured-link" class="link-default" href="<?php echo esc_url($main_house['url']); ?>">
                CONHECER CASA
                <span aria-hidden="true">→</span>
              </a>
            </div>
          </article>
          <!-- MINIATURAS -->
          <?php if (count($house_cards) > 1): ?>
            <div class="houses-thumbnails">
              <?php foreach (array_slice($house_cards, 1) as $house): ?>
                <div class="houses-thumbnail-item hover-image">
                <button type="button" class="houses-thumbnail" data-house-id="<?php echo esc_attr($house['id']); ?>" aria-label="Destacar <?php echo esc_attr($house['title']); ?>" aria-pressed="false">
                  <span class="houses-thumbnail-image">
                    <a class="houses-thumbnail-link " href="<?php echo esc_url($house['url']); ?>" aria-label="Conhecer <?php echo esc_attr($house['title']); ?>">
                      <img src="<?php echo esc_url($house['image']); ?>" alt="" loading="lazy">
                    </a>
                  </span>
                  <h3>
                    <a class="houses-thumbnail-link" href="<?php echo esc_url($house['url']); ?>" aria-label="Conhecer <?php echo esc_attr($house['title']); ?>">
                      <?php echo esc_html($house['title']); ?>
                    </a>
                  </h3>
                  <?php if ($house['neighborhood']): ?>
                    <span class="houses-thumbnail-neighborhood"><?php echo esc_html($house['neighborhood']); ?></span>
                  <?php endif; ?>
                </button>
                </div>
              <?php endforeach; ?>
            </div>
          <?php endif; ?>
        <?php else: ?>
          <p class="houses-empty">
            Nenhuma casa cadastrada.
          </p>
        <?php endif; ?>
      </div>
    </div>
    <?php
    /*
    * Dados disponibilizados ao JavaScript.
    * Não interfere no AJAX da agenda.
    */
    if (!empty($house_cards)) {
      wp_add_inline_script(
        'csamba-main',
        'window.csambaHouses = ' . wp_json_encode(
          $house_cards,
          JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT
        ) . ';',
        'before'
      );
    }
    ?>

    <div class="section-block featured-bands">
      <div class="section-heading-row">
        <header class="section-heading">
          <p>BANDAS</p>
          <h2>EM DESTAQUE</h2>
        </header>
        <a class="button" href="<?php echo esc_url(get_post_type_archive_link('banda')); ?>">Ver todas
        </a>
      </div>
      <div class="band-cards">
        <?php foreach($bands as $b): ?>
           <?php $bio = get_field('banda_bio', $b->ID); ?>
          <article class="hover-image">
            <div class="featured-media">
              <a href="<?php echo esc_url(get_permalink($b)); ?>">
                <img loading="lazy" src="<?php echo esc_url(csamba_image_url($b->ID,'csamba-card',get_the_title($b))); ?>" alt="">
              </a>
            </div>
            <h3><a href="<?php echo esc_url(get_permalink($b)); ?>"><?php echo esc_html(get_the_title($b)); ?></a></h3>
            <?php if ($bio): ?>
              <p>
                <?php echo esc_html( wp_trim_words( wp_strip_all_tags($bio), 25)); ?>
              </p>
            <?php endif; ?>
            <a href="<?php echo esc_url(get_permalink($b)); ?>">ver banda</a>
          </article>
        <?php endforeach; ?>
      </div>
    </div>
  </section>
  <!-- /* AGENDA */ -->
  <?php
    $today = current_datetime();

    $weekdays = [
      0 => 'DOM',
      1 => 'SEG',
      2 => 'TER',
      3 => 'QUA',
      4 => 'QUI',
      5 => 'SEX',
      6 => 'SÁB',
    ];

    $days = [];

    for ($i = 0; $i < 7; $i++) {
      $day = $today->modify("+{$i} days");

      $days[] = [
        'date'  => $day->format('Y-m-d'),
        'day'   => $weekdays[(int) $day->format('w')],
        'label' => $day->format('d/m'),
      ];
    }
  ?>
  <section class="section-block agenda-home">
    <header class="agenda-heading">
      <div class="section-heading">
        <p>HOJE NO SAMBA</p>
        <h2>EM PORTO ALEGRE</h2>
      </div>
      <a href="<?php echo esc_url(home_url('/agenda/')); ?>">
        VER AGENDA COMPLETA →
      </a>
    </header>
    <div class="agenda-shell">
      <!-- BLOCO ESQUERDO -->
      <div class="agenda-main">
        <!-- DIAS DA AGENDA -->
        <div class="agenda-days">
          <?php foreach ($days as $index => $day): ?>
            <button type="button" class="agenda-tab <?php echo $index === 0 ? 'is-active' : ''; ?>"
              data-date="<?php echo esc_attr($day['date']); ?>" aria-pressed="<?php echo $index === 0 ? 'true' : 'false'; ?>">
              <strong>
                <?php echo esc_html($day['day']); ?>
              </strong>
              <span>
                <?php echo esc_html($day['label']); ?>
              </span>
            </button>
          <?php endforeach; ?>
        </div>
        <!-- EVENTOS + BANDAS LADO A LADO -->
        <div class="agenda-body">
          <!-- COLUNA DE EVENTOS -->
          <div class="agenda-events">
            <div class="agenda-events-heading">
              <h3>EVENTOS DO DIA</h3>
              <p>Confira a programação completa</p>
            </div>
            <div id="agenda-events-list" class="agenda-events-list" aria-live="polite" >
              <p class="agenda-loading">
                Carregando agenda...
              </p>
            </div>
            <a href="<?php echo esc_url(home_url('/agenda/')); ?>" class="agenda-see-all" id="agenda-see-all">
              VER TODOS OS EVENTOS DO DIA →
            </a>
          </div>
          
          <!-- ==========================================
          EVENTO EM DESTAQUE
          ========================================== -->
          <div class="agenda-featured">
            <div class="agenda-featured-heading">
              <div>
                <h3>EVENTO EM DESTAQUE</h3>
                <p>Confira os detalhes e não perca!</p>
              </div>
              <div class="agenda-featured-controls">
                <button type="button" class="agenda-featured-prev" aria-label="Evento anterior">‹</button>
                <button type="button" class="agenda-featured-next" aria-label="Próximo evento">›</button>
              </div>
            </div>
            <div class="swiper agenda-featured-swiper">
              <div class="swiper-wrapper" id="agenda-featured-list"></div>
              <div class="swiper-pagination agenda-featured-pagination"></div>
            </div>
            <p class="agenda-featured-empty" id="agenda-featured-empty" hidden >
              Nenhum evento cadastrado para este dia.
            </p>
          </div>
        </div>
      </div>
      <!-- ========================================
      BLOCO DIREITO: MAPA
      ======================================== -->
      <aside class="agenda-map-column">
        <div class="agenda-map-wrapper">
          <div id="agenda-map" aria-label="Mapa dos eventos de samba em Porto Alegre"></div>
          <a href="<?php echo esc_url(home_url('/agenda/')); ?>" class="agenda-open-map" id="agenda-open-map">
            ABRIR NO MAPA →
          </a>
        </div>
      </aside>
    </div>
  </section>
  <!-- /* QUARTA DOBRA */ -->
  <section class="content-columns">
    <div class="news-col">
      <header class="section-heading ruled">
        <p>NOVIDADES</p>
        <h2>CSAMBA</h2>
      </header>
      <?php if ($news): ?>
        <?php foreach ($news as $index => $n): ?>
          <?php
            $categories = get_the_category($n->ID);
            $category   = !empty($categories) ? $categories[0] : null;
            $is_reverse = $index % 2 !== 0;
          ?>
          <div class="news-item">
            <article class="news-card hover-image <?php echo $is_reverse ? 'is-reverse' : ''; ?>">
              <?php if (has_post_thumbnail($n->ID)): ?>
                <a href="<?php echo esc_url(get_permalink($n)); ?>" class="news-image" >
                  <img loading="lazy" src="<?php echo esc_url(csamba_image_url($n->ID,'csamba-card',get_the_title($n))); ?>" alt="">
                </a>
              <?php endif; ?>
              <div class="news-copy">
                <h3>
                  <a href="<?php echo esc_url(get_permalink($n)); ?>">
                    <?php echo esc_html(get_the_title($n)); ?>
                  </a>
                </h3>
                <div class="news-meta">
                  <time datetime="<?php echo esc_attr(get_the_date('c', $n->ID)); ?>">
                    <?php echo esc_html(get_the_date('d/m/Y', $n->ID)); ?>
                  </time>
                  <?php if ($category): ?>
                    <span class="news-meta-separator">|</span>
                    <a class="news-category" href="<?php echo esc_url(get_category_link($category->term_id)); ?>">
                      <?php echo esc_html($category->name); ?>
                    </a>
                  <?php endif; ?>
                </div>
                <p>
                  <?php
                    echo esc_html(wp_trim_words(wp_strip_all_tags($n->post_content),28));
                  ?>
                </p>
              </div>
            </article>
            <div class="news-actions">
              <a href="<?php echo esc_url(get_permalink($n)); ?>" class="button">
                LER A NOTÍCIA
              </a>
              <div class="news-social-actions">
                <?php if (is_user_logged_in()): ?>
                  <button type="button" class="news-like" data-post-id="<?php echo esc_attr($n->ID); ?>">
                    <svg class="news-action-icon news-like-icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M12 2.7l2.8 5.7 6.3.9-4.6 4.4 1.1 6.3-5.6-3-5.6 3 1.1-6.3-4.6-4.4 6.3-.9L12 2.7z"/>
                    </svg>
                    <span>GOSTEI</span>
                </button>
                <?php else: ?>
                  <a href="<?php echo esc_url(wp_login_url(get_permalink($n))); ?>" class="news-login">
                    ENTRE PARA CURTIR
                  </a>
                <?php endif; ?>
                <button type="button" class="news-share" data-url="<?php echo esc_url(get_permalink($n)); ?>" data-title="<?php echo esc_attr(get_the_title($n)); ?>">
                  <svg class="news-action-icon news-share-icon" viewBox="0 0 24 24" aria-hidden="true">
                      <circle cx="18" cy="5" r="2.5"/>
                      <circle cx="6" cy="12" r="2.5"/>
                      <circle cx="18" cy="19" r="2.5"/>
                      <path d="M8.2 10.8l7.6-4.4M8.2 13.2l7.6 4.4"/>
                  </svg>
                  <span>COMPARTILHAR</span>
                </button>
              </div>
            </div>
          </div>
        <?php endforeach; ?>
      <?php endif; ?>
    </div>

    <div class="home-community">
      <header class="section-heading ruled">
        <p>EXPLORE O</p>
        <h2>CSAMBA</h2>
      </header>
      <div class="community-cards">
        <article class="community-card community-register" style="background-image:url('<?php echo esc_url(get_template_directory_uri().'/assets/images/community/bg-cadastre-se-01.jpg'); ?>');">
          <img class="community-icon" src="<?php echo esc_url(get_template_directory_uri() . '/assets/images/community/icon-register-01-white.png'); ?>" alt=""
            aria-hidden="true">
          <h3>CADASTRE-SE</h3>
          <p>Faça parte do CSamba e conecte-se à cena do samba de Porto Alegre.</p>
          <a href="<?php echo esc_url(home_url('/cadastre-se/')); ?>" class="community-link button button-light">
            <span>CADASTRE-SE</span>
            <span aria-hidden="true">→</span>
          </a>
        </article>
        <article class="community-card community-play" style="background-image:url('<?php echo esc_url(get_template_directory_uri().'/assets/images/community/bg-play-01.jpg'); ?>');">
          <img class="community-icon"
            src="<?php echo esc_url(get_template_directory_uri() . '/assets/images/community/ícone-play-white.png'); ?>" alt=""
            aria-hidden="true">
          <h3>CSAMBA PLAY</h3>
          <p>Playlists para ouvir samba e pagode onde estiver.</p>
          <a href="#" class="community-link button button-light">
            <span>OUVIR PLAYLIST</span>
            <span aria-hidden="true">→</span>
          </a>
        </article>
        <article class="community-card community-podcast" style="background-image:url('<?php echo esc_url(get_template_directory_uri().'/assets/images/community/bg-podcast-02.jpg'); ?>');">
          <img class="community-icon"
            src="<?php echo esc_url(get_template_directory_uri() . '/assets/images/community/ícone-podcast-02-white.png'); ?>" alt=""
            aria-hidden="true">
          <h3>PODCAST</h3>
          <p>Conversas, histórias e personagens do samba de Porto Alegre.</p>
          <span class="community-link button button-light is-disabled">
            <span>EM BREVE</span>
          </span>
        </article>
      </div>
      <section class="home-columns">
        <header class="section-heading ruled">
          <p>COLUNAS</p>
          <h2>CSAMBA</h2>
        </header>
        <div class="home-column-cards">
          <?php if ($columns): ?>
              <?php foreach ($columns as $c): ?>
                  <?php
                  $column_terms = get_the_terms($c->ID, 'categoria_coluna');
                  $column_category = (!is_wp_error($column_terms) && !empty($column_terms)) ? $column_terms[0] : null;
                  ?>
                  <article class="home-column-card hover-image">
                    <div class="home-column-meta">
                      <?php if ($column_category): ?>
                          <span><?php echo esc_html($column_category->name); ?></span>
                      <?php endif; ?>
                      <time datetime="<?php echo esc_attr(get_the_date('c', $c->ID)); ?>">
                        <?php echo esc_html(get_the_date('d/m/Y', $c->ID)); ?>
                      </time>
                    </div>
                    <h3>
                      <a href="<?php echo esc_url(get_permalink($c)); ?>">
                        <?php echo esc_html(get_the_title($c)); ?>
                      </a>
                    </h3>
                    <a href="<?php echo esc_url(get_permalink($c)); ?>" class="home-column-image">
                      <img loading="lazy" src="<?php echo esc_url(csamba_image_url($c->ID, 'csamba-card', get_the_title($c))); ?>" alt="">
                    </a>
                    <p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($c->post_content), 18)); ?></p>
                    <a href="<?php echo esc_url(get_permalink($c)); ?>" class="home-column-link">LEIA A COLUNA →</a>
                  </article>
              <?php endforeach; ?>
          <?php else: ?>
              <p class="empty-state">As primeiras colunas do CSamba serão publicadas em breve.</p>
          <?php endif; ?>
        </div>
      </section>
    </div>
  </section>
</div>
<?php get_footer(); ?>
