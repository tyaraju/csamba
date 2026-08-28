<?php
get_header();
the_post();
$band_id = get_the_ID();
$bio = function_exists('get_field') ? (string) get_field('banda_bio', $band_id) : '';
$city = function_exists('get_field') ? (string) get_field('banda_cidade', $band_id) : '';
$formed = function_exists('get_field') ? (string) get_field('banda_formacao', $band_id) : '';
$gallery = csamba_band_gallery($band_id);
$tracks = csamba_band_tracks($band_id);
$clips = csamba_band_clips($band_id);
$socials = [];
if (function_exists('get_field')) {
  foreach (['banda_site'=>'Site','banda_instagram'=>'Instagram','banda_youtube'=>'YouTube','banda_spotify'=>'Spotify'] as $field=>$label) {
    $url = trim((string) get_field($field, $band_id));
    if ($url) $socials[] = ['label'=>$label,'url'=>$url];
  }
}
$band_events = new WP_Query([
  'post_type'=>'evento',
  'posts_per_page'=>6,
  'meta_key'=>'evento_data',
  'orderby'=>'meta_value_num',
  'order'=>'ASC',
  'meta_query'=>[
    'relation'=>'AND',
    ['key'=>'evento_banda','value'=>$band_id,'compare'=>'='],
    ['key'=>'evento_data','value'=>current_time('Ymd'),'compare'=>'>=','type'=>'NUMERIC'],
  ],
]);
?>
<div class="container band-page">
  <div class="breadcrumb">home &gt; bandas &gt; <?php the_title(); ?></div>

  <section class="band-hero" id="sobre">
    <?php if (has_post_thumbnail()): the_post_thumbnail('large', ['class'=>'band-hero-image']); else: ?>
      <img class="band-hero-image" src="<?php echo esc_url(csamba_placeholder(get_the_title())); ?>" alt="">
    <?php endif; ?>
    <div class="band-profile">
      <nav class="band-subnav">
        <a href="#sobre">a banda</a>
        <?php if ($tracks): ?><a href="#musicas">músicas</a><?php endif; ?>
        <?php if ($gallery): ?><a href="#fotos">fotos</a><?php endif; ?>
        <?php if ($clips): ?><a href="#clipes">clipes</a><?php endif; ?>
        <?php if ($band_events->have_posts()): ?><a href="#agenda">agenda</a><?php endif; ?>
      </nav>
      <h1><?php the_title(); ?></h1>
      <?php if ($city || $formed): ?><p class="band-meta"><?php echo esc_html(implode(' • ', array_filter([$city, $formed ? 'desde '.$formed : '']))); ?></p><?php endif; ?>
      <div class="band-bio"><?php echo $bio ? wp_kses_post($bio) : apply_filters('the_content', get_the_content()); ?></div>
      <?php if ($socials): ?><div class="band-socials"><?php foreach($socials as $social): ?><a href="<?php echo esc_url($social['url']); ?>" target="_blank" rel="noopener noreferrer"><?php echo esc_html($social['label']); ?></a><?php endforeach; ?></div><?php endif; ?>
    </div>
  </section>

  <?php if ($gallery): ?>
  <section class="band-section" id="fotos">
    <header class="section-heading ruled"><p>FOTOS</p><h2><?php the_title(); ?></h2></header>
    <div class="band-gallery">
      <?php foreach($gallery as $image_id): ?>
        <a href="<?php echo esc_url(wp_get_attachment_image_url($image_id, 'full')); ?>" target="_blank" rel="noopener">
          <?php echo wp_get_attachment_image($image_id, 'csamba-card', false, ['loading'=>'lazy']); ?>
        </a>
      <?php endforeach; ?>
    </div>
  </section>
  <?php endif; ?>

  <?php if ($tracks): ?>
  <section class="band-section" id="musicas">
    <header class="section-heading ruled"><p>MÚSICAS</p><h2><?php the_title(); ?></h2></header>
    <div class="band-track-list">
      <?php foreach($tracks as $i=>$track): ?>
        <article class="band-track"><span class="track-number"><?php echo esc_html(str_pad((string)($i+1),2,'0',STR_PAD_LEFT)); ?></span><strong><?php echo esc_html($track['title']); ?></strong><?php if($track['url']): ?><a href="<?php echo esc_url($track['url']); ?>" target="_blank" rel="noopener noreferrer">ouvir →</a><?php endif; ?></article>
      <?php endforeach; ?>
    </div>
  </section>
  <?php endif; ?>

  <?php if ($clips): ?>
  <section class="band-section" id="clipes">
    <header class="section-heading ruled"><p>CLIPES</p><h2><?php the_title(); ?></h2></header>
    <div class="band-clips">
      <?php foreach($clips as $clip): ?>
        <article class="band-clip">
          <?php if($clip['url']): ?><a href="<?php echo esc_url($clip['url']); ?>" target="_blank" rel="noopener noreferrer"><?php endif; ?>
            <div class="band-clip-media"><?php if($clip['thumb']): ?><img loading="lazy" src="<?php echo esc_url($clip['thumb']); ?>" alt="<?php echo esc_attr($clip['title']); ?>"><?php endif; ?><span class="play-icon">▶</span></div>
            <h3><?php echo esc_html($clip['title']); ?></h3>
          <?php if($clip['url']): ?></a><?php endif; ?>
        </article>
      <?php endforeach; ?>
    </div>
  </section>
  <?php endif; ?>

  <section class="content-columns band-lower">
    <div class="news-col">
      <header class="section-heading ruled"><p>NOVIDADES</p><h2><?php the_title(); ?></h2></header>
      <?php $news=get_posts(['post_type'=>'post','posts_per_page'=>3]); if($news): foreach($news as $n): ?>
        <article class="news-card"><div class="news-copy"><time><?php echo esc_html(get_the_date('d/m/Y',$n->ID)); ?></time><h3><?php echo esc_html(get_the_title($n)); ?></h3><p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($n->post_content),35)); ?></p><a href="<?php echo esc_url(get_permalink($n)); ?>">Leia a notícia</a></div></article>
      <?php endforeach; endif; ?>
    </div>

    <aside class="sidebar-home" id="agenda">
      <header class="section-heading ruled"><p>AGENDA</p><h2><?php the_title(); ?></h2></header>
      <div class="agenda-list">
        <?php if($band_events->have_posts()): while($band_events->have_posts()): $band_events->the_post();
          $date = function_exists('get_field') ? get_field('evento_data') : '';
          $time = function_exists('get_field') ? get_field('evento_hora') : '';
          $venue_id = function_exists('get_field') ? get_field('evento_casa') : null;
          $date_obj = $date ? DateTime::createFromFormat('Ymd', $date) : null;
        ?>
          <a class="agenda-item" href="<?php the_permalink(); ?>">
            <span class="agenda-date"><strong><?php echo $date_obj ? esc_html($date_obj->format('d')) : '--'; ?></strong><small><?php echo $date_obj ? esc_html(strtoupper(wp_date('M', $date_obj->getTimestamp()))) : 'DATA'; ?></small></span>
            <span class="agenda-main"><strong><?php the_title(); ?></strong><small><?php echo esc_html(trim(($time ? $time.' • ' : '') . ($venue_id ? get_the_title($venue_id) : ''))); ?></small></span>
          </a>
        <?php endwhile; wp_reset_postdata(); else: ?><p class="empty-state">Nenhum evento futuro cadastrado para esta banda.</p><?php endif; ?>
      </div>
      <a class="button" href="<?php echo esc_url(get_post_type_archive_link('evento')); ?>">Veja toda a agenda</a>
    </aside>
  </section>
</div>
<?php get_footer(); ?>
