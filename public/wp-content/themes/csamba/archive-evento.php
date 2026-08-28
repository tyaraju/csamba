<?php get_header(); ?>
<div class="container archive-page">
  <div class="breadcrumb">home &gt; agenda</div>
  <section class="archive-title"><h1>AGENDA</h1><p>Próximos shows, rodas de samba e eventos cadastrados no CSamba.</p></section>

  <?php $events = csamba_upcoming_events(50); ?>
  <div class="agenda-list agenda-archive-list">
    <?php if ($events->have_posts()): while ($events->have_posts()): $events->the_post();
      $date = function_exists('get_field') ? get_field('evento_data') : '';
      $time = function_exists('get_field') ? get_field('evento_hora') : '';
      $band_id = function_exists('get_field') ? get_field('evento_banda') : null;
      $venue_id = function_exists('get_field') ? get_field('evento_casa') : null;
      $city = function_exists('get_field') ? get_field('evento_cidade') : '';
      $date_obj = $date ? DateTime::createFromFormat('Ymd', $date) : null;
    ?>
      <a class="agenda-item" href="<?php the_permalink(); ?>">
        <span class="agenda-date"><strong><?php echo $date_obj ? esc_html($date_obj->format('d')) : '--'; ?></strong><small><?php echo $date_obj ? esc_html(strtoupper(wp_date('M', $date_obj->getTimestamp()))) : 'DATA'; ?></small></span>
        <span class="agenda-main"><strong><?php echo esc_html($band_id ? get_the_title($band_id) : get_the_title()); ?></strong><small><?php echo esc_html(implode(' • ', array_filter([$time, $venue_id ? get_the_title($venue_id) : '', $city]))); ?></small></span>
      </a>
    <?php endwhile; wp_reset_postdata(); else: ?><p class="empty-state">Nenhum evento futuro cadastrado.</p><?php endif; ?>
  </div>
</div>
<?php get_footer(); ?>
