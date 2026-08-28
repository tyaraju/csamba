<?php
/**
 * Template Name: Cadastre sua banda
 * Description: Página editorial para apresentação e formulário de cadastro de bandas.
 */
get_header();
?>
<main class="container page-register-band">
  <?php while (have_posts()): the_post(); ?>
    <header class="section-heading ruled">
      <p>CSAMBA</p>
      <h1><?php the_title(); ?></h1>
    </header>
    <div class="register-band-content">
      <?php the_content(); ?>
    </div>
  <?php endwhile; ?>
</main>
<?php get_footer(); ?>
