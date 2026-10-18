</main>
<?php
$footer_quote=csamba_footer_daily_quote();
$footer_id=$footer_quote?$footer_quote->ID:0;

$footer_text=$footer_id?get_field('trecho',$footer_id):'';
$footer_artist=$footer_id?get_field('artista',$footer_id):'';
$footer_music=$footer_id?get_field('musica',$footer_id):'';
$footer_image_id=$footer_id?get_field('imagem',$footer_id):0;
$footer_color_start=$footer_id?get_field('cor_inicial',$footer_id):'';
$footer_color_end=$footer_id?get_field('cor_final',$footer_id):'';

$footer_text=$footer_text?:'Porto Alegre vive o samba.';
$footer_artist=$footer_artist?:'CSamba';
$footer_image=$footer_image_id?wp_get_attachment_image_url($footer_image_id,'full'):'';
$footer_color_start=sanitize_hex_color($footer_color_start)?:'#F34810';
$footer_color_end=sanitize_hex_color($footer_color_end)?:'#DF1459';
?>
<footer class="site-footer">
  <div class="footer-music" style="--footer-color-start:<?php echo esc_attr($footer_color_start); ?>;--footer-color-end:<?php echo esc_attr($footer_color_end); ?>;<?php if($footer_image): ?>--footer-bg:url('<?php echo esc_url($footer_image); ?>');<?php endif; ?>">
    <div class="container footer-music-inner">
      <div class="footer-music-copy">
        <span class="footer-eyebrow">O SAMBA DO DIA</span>
        <h2>“<?php echo esc_html($footer_text); ?>”</h2>
        <p>
          <?php echo esc_html($footer_artist); ?>
          <?php if($footer_music): ?>
            <span aria-hidden="true"> · </span>
            <?php echo esc_html($footer_music); ?>
          <?php endif; ?>
        </p>
      </div>
      <a href="<?php echo esc_url(home_url('/agenda/')); ?>" class="footer-music-cta">DESCUBRA ONDE TEM SAMBA <span aria-hidden="true">↗</span></a>
    </div>
  </div>
  <div class="footer-main">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-brand">
          <a href="<?php echo esc_url(home_url('/')); ?>" class="footer-logo" aria-label="CSamba - Página inicial">CSAMBA</a>
          <p>Porto Alegre vive o samba.</p>
          <div class="footer-social">
            <a href="https://www.instagram.com/csamba_poa/" target="_blank" rel="noopener noreferrer" aria-label="Instagram">
              <svg viewBox="0 0 24 24" aria-hidden="true">
                <rect x="2" y="2" width="20" height="20" rx="5" fill="none" stroke="currentColor" stroke-width="2"/>
                <circle cx="12" cy="12" r="4" fill="none" stroke="currentColor" stroke-width="2"/>
                <circle cx="17.5" cy="6.5" r="1.2" fill="currentColor"/>
              </svg>
            </a>
            <a href="https://youtube.com/" target="_blank" rel="noopener noreferrer" aria-label="YouTube">
              <svg viewBox="0 0 24 24" aria-hidden="true">
                <rect x="2" y="5" width="20" height="14" rx="4" fill="none" stroke="currentColor" stroke-width="2"/>
                <path d="M10 9L16 12L10 15Z" fill="currentColor"/>
              </svg>
            </a>
            <a href="https://open.spotify.com/" target="_blank" rel="noopener noreferrer" aria-label="Spotify">
              <svg viewBox="0 0 24 24" aria-hidden="true">
                <circle cx="12" cy="12" r="10" fill="none" stroke="currentColor" stroke-width="1.8"/>
                <path d="M6 9C10 7.5 15.5 8 19 10M7 12.5C10.5 11 15 12 18 13.5M8 16C11 15 14 15.5 16.5 17" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"/>
              </svg>
            </a>
          </div>
        </div>
        <nav class="footer-links" aria-label="Explorar">
          <h3>EXPLORE</h3>
          <?php
          wp_nav_menu([
            'theme_location'=>'footer_explore',
            'container'=>false,
            'menu_class'=>'footer-menu',
            'depth'=>1,
            'fallback_cb'=>false
          ]);
          ?>
        </nav>
        <nav class="footer-links" aria-label="Comunidade">
          <h3>PARTICIPE</h3>
          <?php
          wp_nav_menu([
            'theme_location'=>'footer_community',
            'container'=>false,
            'menu_class'=>'footer-menu',
            'depth'=>1,
            'fallback_cb'=>false
          ]);
          ?>
        </nav>
        <div class="footer-contact">
          <?php echo do_shortcode('[csamba_newsletter]'); ?>
        </div>
      </div>
      <div class="footer-bottom">
        <span>© <?php echo esc_html(wp_date('Y')); ?> CSamba. Todos os direitos reservados.</span>
        <span>PORTO ALEGRE / RS</span>
      </div>
    </div>
  </div>
</footer>
<?php wp_footer(); ?>
</body>
</html>