<?php get_header(); ?>
<?php
$featured = csamba_featured_items(7);
$houses = get_posts(['post_type'=>'casa','posts_per_page'=>1]);
$news = get_posts(['post_type'=>'post','posts_per_page'=>5]);
$bands = get_posts(['post_type'=>'banda','posts_per_page'=>3]);
$columns = get_posts(['post_type'=>'coluna','posts_per_page'=>3]);
$event_query = csamba_upcoming_events(6);
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
              <span class="eyebrow">EM DESTAQUE</span>
              <h1><?php echo esc_html($slide['title']); ?></h1>
              <?php if ($slide['subtitle']): ?><h2><?php echo esc_html($slide['subtitle']); ?></h2><?php endif; ?>
              <p><?php echo esc_html($slide['excerpt']); ?></p>
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
      <div class="featured-tabs-title"><strong>OUTROS DESTAQUES</strong><span>Escolha outro destaque</span></div>
      <div class="featured-pagination"></div>
    </aside>
  </section>

  <section class="home-duo">
    <div class="section-block houses">
      <header class="section-heading"><p>CASAS</p><h2>DE SAMBA E PAGODE</h2></header>
      <?php $house=$houses[0]??null; ?>
      <article class="house-card">
        <img loading="lazy" src="<?php echo esc_url($house ? csamba_image_url($house->ID,'csamba-card','Casa de samba') : csamba_placeholder('Casa de samba')); ?>" alt="">
        <div><h3><?php echo $house ? esc_html(get_the_title($house)) : 'Casa de samba'; ?></h3><p><?php echo $house ? esc_html(wp_trim_words(wp_strip_all_tags($house->post_content),24)) : 'Cadastre casas de samba no painel para preencher esta seção.'; ?></p></div>
      </article>
    </div>

    <div class="section-block featured-bands">
      <div class="section-heading-row"><header class="section-heading"><p>BANDAS</p><h2>EM DESTAQUE</h2></header><a class="text-link" href="<?php echo esc_url(get_post_type_archive_link('banda')); ?>">Ver todas</a></div>
      <div class="band-cards">
        <?php foreach($bands as $b): ?><article><img loading="lazy" src="<?php echo esc_url(csamba_image_url($b->ID,'csamba-card',get_the_title($b))); ?>" alt=""><h3><?php echo esc_html(get_the_title($b)); ?></h3><p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($b->post_content),12)); ?></p><a href="<?php echo esc_url(get_permalink($b)); ?>">ver banda</a></article><?php endforeach; ?>
      </div>
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
