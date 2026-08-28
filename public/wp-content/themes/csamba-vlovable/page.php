<?php
/**
 * Páginas estáticas.
 *
 * @package CSamba
 */

get_header();

while ( have_posts() ) :
	the_post();
	?>
	<div class="container stack">
		<?php csamba_breadcrumb( array( get_the_title() => null ) ); ?>
		<article class="card card-pad">
			<h1 style="margin-top:0;"><?php the_title(); ?></h1>
			<div class="entry-content"><?php the_content(); ?></div>
		</article>
	</div>
	<?php
endwhile;

get_footer();
