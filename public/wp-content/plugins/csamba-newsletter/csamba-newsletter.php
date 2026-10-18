
<?php
/**
 * Plugin Name: CSamba Newsletter
 * Description: Cadastro de newsletter com confirmação por e-mail.
 * Version: 1.0.0
 */

if(!defined('ABSPATH'))exit;

function csamba_nl_table(){
  global $wpdb;
  return $wpdb->prefix.'csamba_newsletter';
}
register_activation_hook(__FILE__,function(){
  global $wpdb;
  require_once ABSPATH.'wp-admin/includes/upgrade.php';
  $table=csamba_nl_table();
  $charset=$wpdb->get_charset_collate();
  dbDelta("CREATE TABLE $table (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    email varchar(190) NOT NULL,
    status varchar(20) NOT NULL DEFAULT 'pending',
    token_hash varchar(64) NOT NULL,
    created_at datetime NOT NULL,
    confirmed_at datetime DEFAULT NULL,
    PRIMARY KEY  (id),
    UNIQUE KEY email (email),
    KEY status (status)
  ) $charset;");
});

function csamba_nl_token(){
  return bin2hex(random_bytes(32));
}
function csamba_nl_url($action,$token){
  return add_query_arg([
    'csamba_nl'=>$action,
    'token'=>$token
  ],home_url('/'));
}
function csamba_nl_redirect($status){
  $url=add_query_arg('newsletter_status',$status,home_url('/'));
  wp_safe_redirect($url.'#newsletter');
  exit;
}
function csamba_nl_send_confirmation($email,$token){
  $url=csamba_nl_url('confirm',$token);
  $message="Olá!\n\nConfirme sua inscrição na newsletter do CSamba:\n\n$url\n\nSe você não solicitou a inscrição, ignore esta mensagem.\n\nEquipe CSamba";
  return wp_mail($email,'Confirme sua inscrição no CSamba',$message);
}

add_action('admin_post_nopriv_csamba_newsletter','csamba_nl_subscribe');
add_action('admin_post_csamba_newsletter','csamba_nl_subscribe');

function csamba_nl_subscribe(){
  if(!isset($_POST['csamba_nl_nonce'])||!wp_verify_nonce(sanitize_text_field(wp_unslash($_POST['csamba_nl_nonce'])),'csamba_nl_subscribe')){
    csamba_nl_redirect('erro');
  }
  if(!empty($_POST['website'])){
    csamba_nl_redirect('recebido');
  }
  if(empty($_POST['consentimento'])){
    csamba_nl_redirect('consentimento');
  }
  $email=sanitize_email(wp_unslash($_POST['email']??''));
  if(!is_email($email)){
    csamba_nl_redirect('email');
  }
  $rate_key='csamba_nl_rate_'.hash_hmac('sha256',strtolower($email),wp_salt('auth'));
  if(get_transient($rate_key)){
    csamba_nl_redirect('recebido');
  }
  set_transient($rate_key,1,15*MINUTE_IN_SECONDS);

  global $wpdb;
  $table=csamba_nl_table();
  $existing=$wpdb->get_row($wpdb->prepare("SELECT id,status FROM $table WHERE email=%s",$email));
  if($existing&&$existing->status==='active'){
    csamba_nl_redirect('recebido');
  }
  $token=csamba_nl_token();
  $data=[
    'status'=>'pending',
    'token_hash'=>hash('sha256',$token),
    'confirmed_at'=>null
  ];
  if($existing){
    $saved=$wpdb->update($table,$data,['id'=>$existing->id]);
  }else{
    $data['email']=$email;
    $data['created_at']=current_time('mysql');
    $saved=$wpdb->insert($table,$data);
  }
  if($saved===false){
    csamba_nl_redirect('erro');
  }
  csamba_nl_send_confirmation($email,$token);
  csamba_nl_redirect('recebido');
}

add_action('template_redirect',function(){
  if(empty($_GET['csamba_nl'])||empty($_GET['token']))return;
  $action=sanitize_key(wp_unslash($_GET['csamba_nl']));
  $token=sanitize_text_field(wp_unslash($_GET['token']));
  if(!in_array($action,['confirm','unsubscribe'],true)||!preg_match('/^[a-f0-9]{64}$/',$token)){
    csamba_nl_redirect('link_invalido');
  }
  global $wpdb;
  $table=csamba_nl_table();
  $hash=hash('sha256',$token);
  $row=$wpdb->get_row($wpdb->prepare("SELECT * FROM $table WHERE token_hash=%s",$hash));
  if(!$row){
    csamba_nl_redirect('link_invalido');
  }
  if($action==='confirm'&&$row->status==='pending'){
    $wpdb->update($table,[
      'status'=>'active',
      'confirmed_at'=>current_time('mysql')
    ],['id'=>$row->id]);
    csamba_nl_redirect('confirmado');
  }
  if($action==='unsubscribe'&&$row->status==='active'){
    $wpdb->update($table,[
      'status'=>'unsubscribed',
      'confirmed_at'=>null
    ],['id'=>$row->id]);
    csamba_nl_redirect('descadastrado');
  }
  csamba_nl_redirect('link_invalido');
});

add_shortcode('csamba_newsletter',function(){
  $messages=[
    'recebido'=>'Se o e-mail puder ser inscrito, você receberá uma mensagem de confirmação.',
    'confirmado'=>'Inscrição confirmada! Bem-vindo à newsletter do CSamba.',
    'descadastrado'=>'Seu descadastro foi realizado.',
    'consentimento'=>'É necessário autorizar o recebimento da newsletter.',
    'email'=>'Informe um e-mail válido.',
    'erro'=>'Não foi possível concluir a solicitação. Tente novamente.',
    'link_invalido'=>'Este link não é válido ou já foi utilizado.'
  ];
  $status=sanitize_key(wp_unslash($_GET['newsletter_status']??''));
  ob_start();
  ?>
  <div id="newsletter" class="footer-newsletter">
    <h3>SAMBA NA SUA CAIXA DE ENTRADA</h3>
    <p>Receba novidades, eventos e destaques do CSamba.</p>
    <?php if(isset($messages[$status])): ?>
      <p class="footer-newsletter-message" role="status"><?php echo esc_html($messages[$status]); ?></p>
    <?php endif; ?>
    <form class="footer-newsletter-form" action="<?php echo esc_url(admin_url('admin-post.php')); ?>" method="post">
      <input type="hidden" name="action" value="csamba_newsletter">
      <?php wp_nonce_field('csamba_nl_subscribe','csamba_nl_nonce'); ?>
      <label for="footer-newsletter-email" class="screen-reader-text">Seu e-mail</label>
      <input id="footer-newsletter-email" type="email" name="email" placeholder="Seu melhor e-mail" autocomplete="email" required>
      <button type="submit" aria-label="Inscrever-se na newsletter">→</button>
      <div class="footer-newsletter-honeypot" aria-hidden="true">
        <label for="footer-newsletter-website">Website</label>
        <input id="footer-newsletter-website" type="text" name="website" tabindex="-1" autocomplete="off">
      </div>
      <label class="footer-newsletter-consent">
        <input type="checkbox" name="consentimento" value="1" required>
        <span>Aceito receber a newsletter do CSamba. Posso cancelar quando quiser.</span>
      </label>
    </form>
    <small>Sem spam. Só samba.</small>
  </div>
  <?php
  return ob_get_clean();
});

add_action('admin_menu',function(){
  add_menu_page('Newsletter CSamba','Newsletter','manage_options','csamba-newsletter','csamba_nl_admin','dashicons-email-alt',27);
});
function csamba_nl_admin(){
  if(!current_user_can('manage_options'))return;
  global $wpdb;
  $table=csamba_nl_table();
  $counts=$wpdb->get_results("SELECT status,COUNT(*) AS total FROM $table GROUP BY status");
  $rows=$wpdb->get_results("SELECT email,status,created_at,confirmed_at FROM $table ORDER BY id DESC LIMIT 100");
  ?>
  <div class="wrap">
    <h1>Newsletter CSamba</h1>
    <p>Inscrições mais recentes (até 100 registros).</p>
    <?php foreach($counts as $count): ?>
      <p><strong><?php echo esc_html($count->status); ?>:</strong> <?php echo (int)$count->total; ?></p>
    <?php endforeach; ?>
    <table class="widefat striped">
      <thead><tr><th>E-mail</th><th>Status</th><th>Cadastro</th><th>Confirmação</th></tr></thead>
      <tbody>
      <?php foreach($rows as $row): ?>
        <tr>
          <td><?php echo esc_html($row->email); ?></td>
          <td><?php echo esc_html($row->status); ?></td>
          <td><?php echo esc_html($row->created_at); ?></td>
          <td><?php echo esc_html($row->confirmed_at?:'—'); ?></td>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  </div>
  <?php
}
