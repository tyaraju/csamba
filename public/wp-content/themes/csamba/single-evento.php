<?php get_header(); the_post();
$date = function_exists('get_field') ? get_field('evento_data') : '';
$time = function_exists('get_field') ? get_field('evento_hora') : '';
$band_id = function_exists('get_field') ? get_field('evento_banda') : null;
$venue_id = function_exists('get_field') ? get_field('evento_casa') : null;
$city = function_exists('get_field') ? get_field('evento_cidade') : '';
$ticket = function_exists('get_field') ? get_field('evento_ingresso') : '';
$date_obj = $date ? DateTime::createFromFormat('Ymd', $date) : null;
?>
<div class="container archive-page">
  <div class="breadcrumb">home &gt; agenda &gt; <?php the_title(); ?></div>
  <section class="archive-title"><h1><?php the_title(); ?></h1><p><?php echo esc_html(implode(' • ', array_filter([$date_obj ? wp_date('d/m/Y', $date_obj->getTimestamp()) : '', $time, $venue_id ? get_the_title($venue_id) : '', $city]))); ?></p></section>
  <article class="news-card">
    <?php if (has_post_thumbnail()): the_post_thumbnail('csamba-hero'); endif; ?>
    <div class="news-copy">
      <?php if ($band_id): ?><h3><?php echo esc_html(get_the_title($band_id)); ?></h3><?php endif; ?>
      <?php the_content(); ?>
      <?php if ($ticket): ?><p><a class="button" href="<?php echo esc_url($ticket); ?>" target="_blank" rel="noopener">Ingressos</a></p><?php endif; ?>
    </div>
  </article>
</div>
<?php get_footer(); ?>
