<?php get_header(); ?>
<?php
$featured = csamba_featured_items(7);
$houses = get_posts(['post_type'=>'casa','posts_per_page'=>4]);
$news = get_posts(['post_type'=>'post','posts_per_page'=>5]);
$bands = get_posts(['post_type'=>'banda','posts_per_page'=>3]);
$columns = get_posts(['post_type'=>'coluna','posts_per_page'=>3]);
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
      <header class="section-heading">
        <p>CASAS</p>
        <h2>DE SAMBA E PAGODE</h2>
      </header>
      <div class="houses-showcase">
        <?php if ($main_house): ?>
          <!-- CASA PRINCIPAL -->
          <article class="houses-featured">
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
              <a id="houses-featured-link" class="houses-featured-cta" href="<?php echo esc_url($main_house['url']); ?>">
                CONHECER CASA
                <span aria-hidden="true">→</span>
              </a>
            </div>
          </article>
          <!-- MINIATURAS -->
          <?php if (count($house_cards) > 1): ?>
            <div class="houses-thumbnails">
              <?php foreach (array_slice($house_cards, 1) as $house): ?>
                <div class="houses-thumbnail-item">
                <button type="button" class="houses-thumbnail" data-house-id="<?php echo esc_attr($house['id']); ?>" aria-label="Destacar <?php echo esc_attr($house['title']); ?>" aria-pressed="false">
                  <span class="houses-thumbnail-image">
                    <a class="houses-thumbnail-link" href="<?php echo esc_url($house['url']); ?>" aria-label="Conhecer <?php echo esc_attr($house['title']); ?>">
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
        <!-- RODAPÉ -->
        <div class="houses-footer">
          <a href="<?php echo esc_url(home_url('/casas/')); ?>">
            VER TODAS AS CASAS
            <span aria-hidden="true">→</span>
          </a>
        </div>
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
        <a class="button button-small" href="<?php echo esc_url(get_post_type_archive_link('banda')); ?>">Ver todas</a>
      </div>
      <div class="band-cards">
        <?php foreach($bands as $b): ?>
          <article>
            <div class="featured-media">
              <a href="<?php echo esc_url(get_permalink($b)); ?>">
                <img loading="lazy" src="<?php echo esc_url(csamba_image_url($b->ID,'csamba-card',get_the_title($b))); ?>" alt="">
              </a>
            </div>
            <h3><a href="<?php echo esc_url(get_permalink($b)); ?>"><?php echo esc_html(get_the_title($b)); ?></a></h3>
            <p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($b->post_content),20)); ?></p>
            <a href="<?php echo esc_url(get_permalink($b)); ?>">ver banda</a>
          </article>
        <?php endforeach; ?>
      </div>
    </div>
  </section>
 
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
  <section class="content-columns">
    <div class="news-col">
      <header class="section-heading ruled"><p>NOVIDADES</p><h2>CSAMBA</h2></header>
      <?php if($news): foreach($news as $n): ?>
        <article class="news-card">
          <?php if(has_post_thumbnail($n->ID)): ?><img loading="lazy" src="<?php echo esc_url(csamba_image_url($n->ID,'csamba-card',get_the_title($n))); ?>" alt=""><?php endif; ?>
          <div class="news-copy"><time><?php echo esc_html(get_the_date('d/m/Y',$n->ID)); ?></time><h3><?php echo esc_html(get_the_title($n)); ?></h3><p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($n->post_content),28)); ?></p><a href="<?php echo esc_url(get_permalink($n)); ?>">Leia a notícia</a></div>
        </article>
      <?php endforeach; endif; ?>
    </div>

    <aside class="sidebar-home">
      <header class="section-heading ruled"><p>AGENDA</p><h2>CSAMBA</h2></header>
      <div class="agenda-list">
        <?php if($event_query->have_posts()): while($event_query->have_posts()): $event_query->the_post();
          $date = function_exists('get_field') ? get_field('evento_data') : '';
          $time = function_exists('get_field') ? get_field('evento_hora') : '';
          $band_id = function_exists('get_field') ? get_field('evento_banda') : null;
          $venue_id = function_exists('get_field') ? get_field('evento_casa') : null;
          $date_obj = $date ? DateTime::createFromFormat('Ymd', $date) : null;
        ?>
          <a class="agenda-item" href="<?php the_permalink(); ?>">
            <span class="agenda-date"><strong><?php echo $date_obj ? esc_html($date_obj->format('d')) : '--'; ?></strong><small><?php echo $date_obj ? esc_html(strtoupper(wp_date('M', $date_obj->getTimestamp()))) : 'DATA'; ?></small></span>
            <span class="agenda-main"><strong><?php echo esc_html($band_id ? get_the_title($band_id) : get_the_title()); ?></strong><small><?php echo esc_html(trim(($time ? $time.' • ' : '') . ($venue_id ? get_the_title($venue_id) : ''))); ?></small></span>
          </a>
        <?php endwhile; wp_reset_postdata(); else: ?>
          <p class="empty-state">Cadastre eventos com data para exibir a próxima agenda automaticamente.</p>
        <?php endif; ?>
      </div>
      <a class="button" href="<?php echo esc_url(get_post_type_archive_link('evento')); ?>">Veja toda a agenda</a>

      <div class="promo-grid">
        <article><div class="promo-icon">♥</div><h3>CADASTRE-SE</h3><p>Participe da comunidade CSamba.</p></article>
        <article><div class="promo-icon">▶</div><h3>RÁDIO WEB</h3><p>Ouça a rádio CSamba.</p></article>
        <article><div class="promo-icon">◉</div><h3>PODCAST</h3><p>Ouça os episódios.</p></article>
      </div>

      <div class="columns-block">
        <header class="section-heading ruled"><p>COLUNAS</p><h2>CSAMBA</h2></header>
        <div class="column-cards">
          <?php foreach($columns as $c): ?><article><img loading="lazy" src="<?php echo esc_url(csamba_image_url($c->ID,'csamba-card',get_the_title($c))); ?>" alt=""><h3><?php echo esc_html(get_the_title($c)); ?></h3><p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($c->post_content),16)); ?></p><a href="<?php echo esc_url(get_permalink($c)); ?>">Leia mais</a></article><?php endforeach; ?>
        </div>
      </div>
    </aside>
  </section>
</div>
<?php get_footer(); ?>
