<?php get_header(); ?>
<div class="container archive-page">
  <div class="breadcrumb">home &gt; bandas</div>
  <section class="archive-title"><h1>BANDAS</h1><p>Lorem ipsum is simply dummy text of the printing and typesetting industry.</p></section>
  <?php
  $featured = get_posts(['post_type'=>'banda','posts_per_page'=>1,'meta_key'=>'csamba_destaque','meta_value'=>'1']);
  if(!$featured) $featured = get_posts(['post_type'=>'banda','posts_per_page'=>1]);
  $f=$featured[0]??null;
  ?>
  <section class="archive-featured">
    <img src="<?php echo esc_url($f ? csamba_image_url($f->ID,'large',get_the_title($f)) : csamba_placeholder('Grupo Zueira')); ?>" alt="">
    <div><h2>EM DESTAQUE</h2><h3><?php echo $f ? esc_html(get_the_title($f)) : 'GRUPO ZUEIRA'; ?></h3><p><?php echo $f ? esc_html(wp_trim_words(wp_strip_all_tags($f->post_content),34)) : 'Conteúdo demonstrativo da banda em destaque.'; ?></p><?php if($f): ?><a href="<?php echo esc_url(get_permalink($f)); ?>">clique aqui</a><?php endif; ?></div>
  </section>
  <div class="az-header"><h2>BANDAS DE A a Z</h2><form role="search" method="get" action="<?php echo esc_url(home_url('/')); ?>"><span>⌕ buscar banda</span><input name="s"><input type="hidden" name="post_type" value="banda"><button>BUSCAR</button></form></div>
  <?php
  $all = get_posts(['post_type'=>'banda','posts_per_page'=>-1,'orderby'=>'title','order'=>'ASC']);
  $groups=[];
  foreach($all as $b){ $letter = strtoupper(remove_accents(mb_substr(get_the_title($b),0,1))); $groups[$letter][]=$b; }
  if(!$groups){
    $demo=['Abolisamba','Aceito Sugestão','Ademir do Cavaco','Adriana e a Rapaziada','Afirmacão','Almir Guineto','Amigos do Samba','Banda Primos & Cia','Banda Razão de viver','Batifun','Batóm na Cueca','Bebeto','Beijo Doce','Cacete Armado','Cachasamba','Candeia','Cantakgente','Cartola','Casa Nossa','Casa Sério','C4 Casa De Samba','Cesar Costa Filho'];
    foreach($demo as $name){$groups[strtoupper(substr(remove_accents($name),0,1))][]=$name;}
  }
  ?>
  <div class="az-grid">
    <?php foreach($groups as $letter=>$items): ?><section class="letter-group"><h3><?php echo esc_html($letter); ?></h3><?php foreach($items as $b): if(is_object($b)): ?><a href="<?php echo esc_url(get_permalink($b)); ?>"><?php echo esc_html(get_the_title($b)); ?></a><?php else: ?><a href="#"><?php echo esc_html($b); ?></a><?php endif; endforeach; ?></section><?php endforeach; ?>
  </div>
</div>
<?php get_footer(); ?>
