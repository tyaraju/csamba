<?php get_header(); ?>
<div class="container generic-page">
<?php if(have_posts()): while(have_posts()): the_post(); ?><article <?php post_class(); ?>><h1><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h1><?php the_excerpt(); ?></article><?php endwhile; else: ?><p>Nenhum conteúdo encontrado.</p><?php endif; ?>
</div>
<?php get_footer(); ?>
