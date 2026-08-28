<?php get_header(); the_post(); ?>
<div class="container band-page">
  <div class="breadcrumb">home &gt; bandas &gt; <?php the_title(); ?></div>
  <section class="band-hero">
    <img src="<?php echo esc_url(csamba_image_url(get_the_ID(),'large',get_the_title())); ?>" alt="<?php the_title_attribute(); ?>">
    <div class="band-profile">
      <nav class="band-subnav"><a href="#sobre">a banda</a><a href="#musicas">músicas</a><a href="#letras">letras</a><a href="#fotos">fotos</a><a href="#clipes">clipes</a><a href="#votacao">votação</a><a href="#radio">rádio</a></nav>
      <div class="approve">👍<small>EU<br>APROVO</small></div>
      <h1>GRUPO <strong><?php the_title(); ?></strong></h1>
      <div class="band-excerpt"><?php echo esc_html(csamba_excerpt(38)); ?></div>
    </div>
  </section>
  <section class="feature-boxes">
    <article id="fotos"><div class="big-icon">▣</div><h2>FOTOS <strong><?php the_title(); ?></strong></h2><a href="#">VEJA TODAS FOTOS →</a><p>Veja o álbum de fotos que a banda preparou pra você</p></article>
    <article id="radio"><div class="big-icon">▶</div><h2>RÁDIO <strong><?php the_title(); ?></strong></h2><a href="#">OUÇA OUTRAS RÁDIOS →</a><p>Ouça já a rádio <?php the_title(); ?></p></article>
    <article id="letras"><div class="big-icon">▤</div><h2>LETRAS <strong><?php the_title(); ?></strong></h2><a href="#">VEJA TODAS LETRAS →</a><p>Aprenda a cantar agora as músicas da banda</p></article>
  </section>
  <section class="content-columns band-lower">
    <div class="news-col">
      <div class="headline"><h2>NOVIDADES <strong><?php the_title(); ?></strong></h2></div>
      <?php $news=get_posts(['posts_per_page'=>3]); if($news): foreach($news as $n): ?><div class="date-line"><?php echo esc_html(csamba_date_label($n->ID)); ?></div><article class="news-card"><div class="news-copy"><h3><?php echo esc_html(get_the_title($n)); ?></h3><p><?php echo esc_html(wp_trim_words(wp_strip_all_tags($n->post_content),35)); ?></p></div><div class="news-actions"><a href="<?php echo esc_url(get_permalink($n)); ?>">VEJA TODA A NOTÍCIA →</a><span>☆ GOSTEI</span><span>ENVIE ESSA NOTÍCIA ✉</span></div></article><?php endforeach; else: foreach(['Pixote','Jeito Moleque invade Viamão','Zueira no Opinião'] as $name): ?><div class="date-line">23 de abril de 2009</div><article class="news-card"><div class="news-copy"><h3><?php echo esc_html($name); ?></h3><p>Conteúdo de demonstração para a página da banda.</p></div><div class="news-actions"><a href="#">VEJA TODA A NOTÍCIA →</a><span>☆ GOSTEI</span><span>ENVIE ESSA NOTÍCIA ✉</span></div></article><?php endforeach; endif; ?>
      <div class="pager"><a href="#">← anterior</a><a href="#">próximo →</a></div>
    </div>
    <aside class="sidebar-home">
      <div class="headline"><h2>AGENDA <strong><?php the_title(); ?></strong></h2><span>PATROCINADO POR <b>Bradesco</b></span></div>
      <div class="agenda-list"><div class="agenda-day">SEG</div><?php for($i=0;$i<2;$i++): ?><div class="agenda-row"><b>CHILECO</b><span>Lorem ipsum is simply dummy</span></div><?php endfor; ?><div class="agenda-day">TER</div><?php for($i=0;$i<2;$i++): ?><div class="agenda-row"><b>CHILECO</b><span>Lorem ipsum is simply dummy</span></div><?php endfor; ?><div class="agenda-day">QUA</div><?php for($i=0;$i<2;$i++): ?><div class="agenda-row"><b>CHILECO</b><span>Lorem ipsum is simply dummy</span></div><?php endfor; ?></div>
      <a class="btn" href="#">VEJA TODA A AGENDA →</a>
      <div class="promo-grid"><div><div class="promo-icon">♥</div><h3>CADASTRE-SE</h3><p>saiba como aproveitar ao máximo o CSamba</p></div><div><div class="promo-icon">▶</div><h3>RÁDIO WEB</h3><p>Ouça já a rádio CSamba</p></div><div><div class="promo-icon">◉</div><h3>PODCAST</h3><p>Baixe o iTunes e ouça o podcast</p></div></div>
    </aside>
  </section>
</div>
<?php get_footer(); ?>
