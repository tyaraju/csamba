<?php
if (!defined('ABSPATH'))
  exit;

define('CSAMBA_VERSION', '0.4.0');

function csamba_setup(): void
{
  add_theme_support('title-tag');
  add_theme_support('post-thumbnails');
  add_theme_support('responsive-embeds');
  add_theme_support('html5', ['search-form', 'gallery', 'caption', 'style', 'script']);
  add_image_size('csamba-card', 520, 320, true);
  add_image_size('csamba-hero', 980, 620, true);
  add_image_size('csamba-thumb', 240, 160, true);
  register_nav_menus([
    'primary' => 'Menu principal',
    'band' => 'Menu da banda',
  ]);
}
add_action('after_setup_theme', 'csamba_setup');

function csamba_assets(): void {
    $vite_dev_server = 'http://localhost:5173';
    $manifest_path = get_template_directory() . '/assets/dist/.vite/manifest.json';

    // Desenvolvimento com Vite
    if (defined('WP_DEBUG') && WP_DEBUG) {
        wp_enqueue_script(
            'vite-client',
            $vite_dev_server . '/@vite/client',
            [],
            null,
            false
        );

        wp_enqueue_script(
            'csamba-main',
            $vite_dev_server . '/src/js/main.js',
            [],
            null,
            true
        );

        return;
    }

    // Produção
    if (file_exists($manifest_path)) {
        $manifest = json_decode(
            file_get_contents($manifest_path),
            true
        );

        $entry = $manifest['src/js/main.js'] ?? null;

        if ($entry) {

            if (!empty($entry['css'])) {
                foreach ($entry['css'] as $index => $css) {
                    wp_enqueue_style(
                        'csamba-main-' . $index,
                        get_template_directory_uri() . '/assets/dist/' . $css,
                        [],
                        CSAMBA_THEME_VERSION
                    );
                }
            }

            wp_enqueue_script(
                'csamba-main',
                get_template_directory_uri() . '/assets/dist/' . $entry['file'],
                [],
                CSAMBA_THEME_VERSION,
                true
            );
        }
    }
}
add_action('wp_enqueue_scripts', 'csamba_assets');

function csamba_vite_module_scripts($tag, $handle, $src) {
    if (in_array($handle, ['vite-client', 'csamba-main'], true)) {
        return '<script type="module" src="' . esc_url($src) . '"></script>';
    }

    return $tag;
}
add_filter('script_loader_tag', 'csamba_vite_module_scripts', 10, 3);

function csamba_register_content_types(): void
{
  $types = [
    'banda' => ['Bandas', 'Banda', 'dashicons-groups', true],
    'casa' => ['Casas', 'Casa', 'dashicons-admin-home', true],
    'evento' => ['Agenda', 'Evento', 'dashicons-calendar-alt', true],
    'coluna' => ['Colunas', 'Coluna', 'dashicons-welcome-write-blog', true],
    'destaque' => ['Destaques', 'Destaque', 'dashicons-star-filled', false],
  ];
  foreach ($types as $slug => [$plural, $singular, $icon, $archive]) {
    register_post_type($slug, [
      'labels' => [
        'name' => $plural,
        'singular_name' => $singular,
        'add_new_item' => "Adicionar $singular",
        'edit_item' => "Editar $singular"
      ],
      'public' => true,
      'has_archive' => $archive,
      'rewrite' => ['slug' => $slug === 'banda' ? 'bandas' : ($slug === 'evento' ? 'agenda' : $slug)],
      'menu_icon' => $icon,
      'supports' => $slug === 'destaque' ? ['title', 'page-attributes'] : ['title', 'editor', 'excerpt', 'thumbnail'],
      'show_in_rest' => true,
    ]);
  }

  register_taxonomy('genero', ['banda'], [
    'label' => 'Gêneros',
    'public' => true,
    'hierarchical' => true,
    'show_in_rest' => true,
    'rewrite' => ['slug' => 'genero'],
  ]);
}
add_action('init', 'csamba_register_content_types');

/** ACF: campos versionados no tema. Funciona com ACF Free. */
function csamba_register_acf_fields(): void
{
  if (!function_exists('acf_add_local_field_group'))
    return;

  acf_add_local_field_group([
    'key' => 'group_csamba_menu',
    'title' => 'CSamba — Menu',
    'fields' => [
      [
        'key' => 'field_csamba_menu_color',
        'label' => 'Cor do item',
        'name' => 'csamba_menu_color',
        'type' => 'color_picker',
        'default_value' => '#2878d7',
      ]
    ],
    'location' => [[['param' => 'nav_menu_item', 'operator' => '==', 'value' => 'all']]],
  ]);

  acf_add_local_field_group([
    'key' => 'group_csamba_destaque',
    'title' => 'CSamba — Destaque do Swiper',
    'fields' => [
      [
        'key' => 'field_csamba_target',
        'label' => 'Conteúdo destacado',
        'name' => 'csamba_target',
        'type' => 'post_object',
        'post_type' => ['post', 'page', 'banda', 'casa', 'evento', 'coluna'],
        'return_format' => 'id',
        'required' => 1,
        'ui' => 1,
      ],
      ['key' => 'field_csamba_slide_color', 'label' => 'Cor do botão / destaque', 'name' => 'csamba_slide_color', 'type' => 'color_picker', 'default_value' => '#2878d7'],
      [
        'key' => 'field_csamba_slide_gradient',
        'label' => 'Usar gradiente',
        'name' => 'csamba_slide_gradient',
        'type' => 'true_false',
        'instructions' => 'Quando ativado, o tema gera automaticamente uma segunda cor análoga a partir da cor do destaque.',
        'default_value' => 1,
        'ui' => 1,
        'ui_on_text' => 'Sim',
        'ui_off_text' => 'Não',
      ],
      ['key' => 'field_csamba_subtitulo', 'label' => 'Subtítulo', 'name' => 'csamba_subtitulo', 'type' => 'text'],
      ['key' => 'field_csamba_descricao', 'label' => 'Descrição', 'name' => 'csamba_descricao', 'type' => 'text'],
      ['key' => 'field_csamba_slide_image', 'label' => 'Imagem alternativa do slide', 'name' => 'csamba_slide_image', 'type' => 'image', 'return_format' => 'id', 'preview_size' => 'medium'],
      ['key' => 'field_csamba_cta', 'label' => 'Texto do botão', 'name' => 'csamba_cta', 'type' => 'text', 'default_value' => 'Veja mais'],
    ],
    'location' => [[['param' => 'post_type', 'operator' => '==', 'value' => 'destaque']]],
  ]);

  $band_fields = [
    ['key' => 'field_banda_tab_sobre', 'label' => 'Sobre', 'name' => '', 'type' => 'tab', 'placement' => 'top'],
    ['key' => 'field_banda_bio', 'label' => 'Biografia', 'name' => 'banda_bio', 'type' => 'wysiwyg', 'tabs' => 'all', 'toolbar' => 'basic', 'media_upload' => 0],
    ['key' => 'field_banda_cidade', 'label' => 'Cidade / origem', 'name' => 'banda_cidade', 'type' => 'text'],
    ['key' => 'field_banda_formacao', 'label' => 'Ano de formação', 'name' => 'banda_formacao', 'type' => 'number', 'min' => 1900, 'max' => 2100],
    ['key' => 'field_banda_site', 'label' => 'Site oficial', 'name' => 'banda_site', 'type' => 'url'],
    ['key' => 'field_banda_instagram', 'label' => 'Instagram', 'name' => 'banda_instagram', 'type' => 'url'],
    ['key' => 'field_banda_youtube', 'label' => 'Canal no YouTube', 'name' => 'banda_youtube', 'type' => 'url'],
    ['key' => 'field_banda_spotify', 'label' => 'Spotify', 'name' => 'banda_spotify', 'type' => 'url'],

    ['key' => 'field_banda_tab_fotos', 'label' => 'Fotos', 'name' => '', 'type' => 'tab', 'placement' => 'top'],
    ['key' => 'field_banda_fotos_info', 'label' => 'Galeria', 'name' => '', 'type' => 'message', 'message' => 'Use estes campos para a galeria principal da banda. A imagem destacada do WordPress continua sendo a foto/capa principal.'],
  ];

  for ($i = 1; $i <= 8; $i++) {
    $band_fields[] = [
      'key' => 'field_banda_foto_' . $i,
      'label' => 'Foto ' . $i,
      'name' => 'banda_foto_' . $i,
      'type' => 'image',
      'return_format' => 'id',
      'preview_size' => 'medium',
      'library' => 'all',
    ];
  }

  $band_fields[] = ['key' => 'field_banda_tab_musicas', 'label' => 'Músicas', 'name' => '', 'type' => 'tab', 'placement' => 'top'];
  $band_fields[] = ['key' => 'field_banda_musicas_info', 'label' => 'Músicas', 'name' => '', 'type' => 'message', 'message' => 'Cadastre até 6 músicas. O link pode apontar para Spotify, SoundCloud, YouTube Music ou arquivo de áudio.'];
  for ($i = 1; $i <= 6; $i++) {
    $band_fields[] = ['key' => 'field_banda_musica_titulo_' . $i, 'label' => 'Música ' . $i . ' — título', 'name' => 'banda_musica_titulo_' . $i, 'type' => 'text', 'wrapper' => ['width' => '35']];
    $band_fields[] = ['key' => 'field_banda_musica_url_' . $i, 'label' => 'Música ' . $i . ' — link', 'name' => 'banda_musica_url_' . $i, 'type' => 'url', 'wrapper' => ['width' => '65']];
  }

  $band_fields[] = ['key' => 'field_banda_tab_clipes', 'label' => 'Clipes', 'name' => '', 'type' => 'tab', 'placement' => 'top'];
  $band_fields[] = ['key' => 'field_banda_clipes_info', 'label' => 'Clipes', 'name' => '', 'type' => 'message', 'message' => 'Cole o link do YouTube. A miniatura é opcional: se ficar vazia, o tema tenta usar automaticamente a thumbnail do vídeo.'];
  for ($i = 1; $i <= 6; $i++) {
    $band_fields[] = ['key' => 'field_banda_clipe_titulo_' . $i, 'label' => 'Clipe ' . $i . ' — título', 'name' => 'banda_clipe_titulo_' . $i, 'type' => 'text', 'wrapper' => ['width' => '30']];
    $band_fields[] = ['key' => 'field_banda_clipe_url_' . $i, 'label' => 'Clipe ' . $i . ' — YouTube', 'name' => 'banda_clipe_url_' . $i, 'type' => 'url', 'wrapper' => ['width' => '45']];
    $band_fields[] = ['key' => 'field_banda_clipe_thumb_' . $i, 'label' => 'Clipe ' . $i . ' — imagem', 'name' => 'banda_clipe_thumb_' . $i, 'type' => 'image', 'return_format' => 'id', 'preview_size' => 'thumbnail', 'wrapper' => ['width' => '25']];
  }

  acf_add_local_field_group([
    'key' => 'group_csamba_banda',
    'title' => 'CSamba — Banda',
    'fields' => $band_fields,
    'location' => [[['param' => 'post_type', 'operator' => '==', 'value' => 'banda']]],
    'position' => 'normal',
    'style' => 'default',
  ]);

  acf_add_local_field_group([
    'key' => 'group_csamba_evento',
    'title' => 'CSamba — Evento / Agenda',
    'fields' => [
      ['key' => 'field_evento_data', 'label' => 'Data', 'name' => 'evento_data', 'type' => 'date_picker', 'display_format' => 'd/m/Y', 'return_format' => 'Ymd', 'required' => 1],
      ['key' => 'field_evento_hora', 'label' => 'Horário', 'name' => 'evento_hora', 'type' => 'time_picker', 'display_format' => 'H:i', 'return_format' => 'H:i'],
      ['key' => 'field_evento_banda', 'label' => 'Banda', 'name' => 'evento_banda', 'type' => 'post_object', 'post_type' => ['banda'], 'return_format' => 'id', 'allow_null' => 1],
      ['key' => 'field_evento_casa', 'label' => 'Casa / Local', 'name' => 'evento_casa', 'type' => 'post_object', 'post_type' => ['casa'], 'return_format' => 'id', 'allow_null' => 1],
      ['key' => 'field_evento_cidade', 'label' => 'Cidade', 'name' => 'evento_cidade', 'type' => 'text'],
      ['key' => 'field_evento_ingresso', 'label' => 'Link de ingressos', 'name' => 'evento_ingresso', 'type' => 'url'],
    ],
    'location' => [[['param' => 'post_type', 'operator' => '==', 'value' => 'evento']]],
  ]);

  acf_add_local_field_group([
    'key' => 'group_csamba_casa',
    'title' => 'CSamba — Casa de Samba',
    'fields' => [

      // =========================
      // SOBRE
      // =========================
      [
        'key' => 'field_casa_tab_sobre',
        'label' => 'Sobre',
        'name' => '',
        'type' => 'tab',
        'placement' => 'top',
      ],
      [
        'key' => 'field_casa_descricao',
        'label' => 'Descrição',
        'name' => 'casa_descricao',
        'type' => 'wysiwyg',
        'tabs' => 'all',
        'toolbar' => 'basic',
        'media_upload' => 0,
      ],
      [
        'key' => 'field_casa_tipo',
        'label' => 'Tipo de estabelecimento',
        'name' => 'casa_tipo',
        'type' => 'select',
        'choices' => [
          'bar' => 'Bar',
          'casa_de_shows' => 'Casa de shows',
          'restaurante' => 'Restaurante',
          'clube' => 'Clube',
          'centro_cultural' => 'Centro cultural',
          'outro' => 'Outro',
        ],
        'allow_null' => 1,
        'ui' => 1,
      ],

      // =========================
      // LOCALIZAÇÃO
      // =========================
      [
        'key' => 'field_casa_tab_localizacao',
        'label' => 'Localização',
        'name' => '',
        'type' => 'tab',
        'placement' => 'top',
      ],
      [
        'key' => 'field_casa_endereco',
        'label' => 'Endereço',
        'name' => 'casa_endereco',
        'type' => 'text',
        'wrapper' => ['width' => '60'],
      ],
      [
        'key' => 'field_casa_numero',
        'label' => 'Número',
        'name' => 'casa_numero',
        'type' => 'text',
        'wrapper' => ['width' => '20'],
      ],
      [
        'key' => 'field_casa_complemento',
        'label' => 'Complemento',
        'name' => 'casa_complemento',
        'type' => 'text',
        'wrapper' => ['width' => '20'],
      ],
      [
        'key' => 'field_casa_bairro',
        'label' => 'Bairro',
        'name' => 'casa_bairro',
        'type' => 'text',
        'wrapper' => ['width' => '35'],
      ],
      [
        'key' => 'field_casa_cidade',
        'label' => 'Cidade',
        'name' => 'casa_cidade',
        'type' => 'text',
        'wrapper' => ['width' => '35'],
      ],
      [
        'key' => 'field_casa_estado',
        'label' => 'Estado',
        'name' => 'casa_estado',
        'type' => 'select',
        'choices' => [
          'AC' => 'AC',
          'AL' => 'AL',
          'AP' => 'AP',
          'AM' => 'AM',
          'BA' => 'BA',
          'CE' => 'CE',
          'DF' => 'DF',
          'ES' => 'ES',
          'GO' => 'GO',
          'MA' => 'MA',
          'MT' => 'MT',
          'MS' => 'MS',
          'MG' => 'MG',
          'PA' => 'PA',
          'PB' => 'PB',
          'PR' => 'PR',
          'PE' => 'PE',
          'PI' => 'PI',
          'RJ' => 'RJ',
          'RN' => 'RN',
          'RS' => 'RS',
          'RO' => 'RO',
          'RR' => 'RR',
          'SC' => 'SC',
          'SP' => 'SP',
          'SE' => 'SE',
          'TO' => 'TO',
        ],
        'default_value' => 'RS',
        'ui' => 1,
        'wrapper' => ['width' => '15'],
      ],
      [
        'key' => 'field_casa_cep',
        'label' => 'CEP',
        'name' => 'casa_cep',
        'type' => 'text',
        'wrapper' => ['width' => '15'],
      ],
      [
        'key' => 'field_casa_maps',
        'label' => 'Link do Google Maps',
        'name' => 'casa_maps',
        'type' => 'url',
        'instructions' => 'Cole o link público da localização no Google Maps.',
      ],

      // =========================
      // CONTATO
      // =========================
      [
        'key' => 'field_casa_tab_contato',
        'label' => 'Contato e redes',
        'name' => '',
        'type' => 'tab',
        'placement' => 'top',
      ],
      [
        'key' => 'field_casa_telefone',
        'label' => 'Telefone',
        'name' => 'casa_telefone',
        'type' => 'text',
        'wrapper' => ['width' => '50'],
      ],
      [
        'key' => 'field_casa_whatsapp',
        'label' => 'WhatsApp',
        'name' => 'casa_whatsapp',
        'type' => 'text',
        'wrapper' => ['width' => '50'],
      ],
      [
        'key' => 'field_casa_site',
        'label' => 'Site oficial',
        'name' => 'casa_site',
        'type' => 'url',
      ],
      [
        'key' => 'field_casa_instagram',
        'label' => 'Instagram',
        'name' => 'casa_instagram',
        'type' => 'url',
      ],
      [
        'key' => 'field_casa_facebook',
        'label' => 'Facebook',
        'name' => 'casa_facebook',
        'type' => 'url',
      ],

      // =========================
      // FUNCIONAMENTO
      // =========================
      [
        'key' => 'field_casa_tab_funcionamento',
        'label' => 'Funcionamento',
        'name' => '',
        'type' => 'tab',
        'placement' => 'top',
      ],
      [
        'key' => 'field_casa_horarios',
        'label' => 'Dias e horários',
        'name' => 'casa_horarios',
        'type' => 'textarea',
        'instructions' => "Ex.: Quinta: 19h–02h\nSexta e sábado: 18h–03h\nDomingo: 16h–00h",
        'rows' => 5,
      ],
      [
        'key' => 'field_casa_reservas',
        'label' => 'Link para reservas',
        'name' => 'casa_reservas',
        'type' => 'url',
      ],
      [
        'key' => 'field_casa_ingressos',
        'label' => 'Link de ingressos / programação',
        'name' => 'casa_ingressos',
        'type' => 'url',
      ],

      // =========================
      // ESTRUTURA
      // =========================
      [
        'key' => 'field_casa_tab_estrutura',
        'label' => 'Estrutura',
        'name' => '',
        'type' => 'tab',
        'placement' => 'top',
      ],
      [
        'key' => 'field_casa_acessibilidade',
        'label' => 'Possui acessibilidade?',
        'name' => 'casa_acessibilidade',
        'type' => 'true_false',
        'ui' => 1,
      ],
      [
        'key' => 'field_casa_estacionamento',
        'label' => 'Possui estacionamento?',
        'name' => 'casa_estacionamento',
        'type' => 'true_false',
        'ui' => 1,
      ],
      [
        'key' => 'field_casa_area_externa',
        'label' => 'Possui área externa?',
        'name' => 'casa_area_externa',
        'type' => 'true_false',
        'ui' => 1,
      ],
      [
        'key' => 'field_casa_comida',
        'label' => 'Serve comida?',
        'name' => 'casa_comida',
        'type' => 'true_false',
        'ui' => 1,
      ],

      // =========================
      // FOTOS
      // =========================
      [
        'key' => 'field_casa_tab_fotos',
        'label' => 'Fotos',
        'name' => '',
        'type' => 'tab',
        'placement' => 'top',
      ],
      [
        'key' => 'field_casa_fotos_info',
        'label' => 'Galeria',
        'name' => '',
        'type' => 'message',
        'message' => 'A imagem destacada continua sendo a foto principal da casa. Cadastre abaixo imagens adicionais para a galeria.',
      ],
      [
        'key' => 'field_casa_foto_1',
        'label' => 'Foto 1',
        'name' => 'casa_foto_1',
        'type' => 'image',
        'return_format' => 'id',
        'preview_size' => 'medium',
        'wrapper' => ['width' => '33'],
      ],
      [
        'key' => 'field_casa_foto_2',
        'label' => 'Foto 2',
        'name' => 'casa_foto_2',
        'type' => 'image',
        'return_format' => 'id',
        'preview_size' => 'medium',
        'wrapper' => ['width' => '33'],
      ],
      [
        'key' => 'field_casa_foto_3',
        'label' => 'Foto 3',
        'name' => 'casa_foto_3',
        'type' => 'image',
        'return_format' => 'id',
        'preview_size' => 'medium',
        'wrapper' => ['width' => '33'],
      ],
      [
        'key' => 'field_casa_foto_4',
        'label' => 'Foto 4',
        'name' => 'casa_foto_4',
        'type' => 'image',
        'return_format' => 'id',
        'preview_size' => 'medium',
        'wrapper' => ['width' => '33'],
      ],
      [
        'key' => 'field_casa_foto_5',
        'label' => 'Foto 5',
        'name' => 'casa_foto_5',
        'type' => 'image',
        'return_format' => 'id',
        'preview_size' => 'medium',
        'wrapper' => ['width' => '33'],
      ],
      [
        'key' => 'field_casa_foto_6',
        'label' => 'Foto 6',
        'name' => 'casa_foto_6',
        'type' => 'image',
        'return_format' => 'id',
        'preview_size' => 'medium',
        'wrapper' => ['width' => '33'],
      ],
    ],
    'location' => [[
      [
        'param' => 'post_type',
        'operator' => '==',
        'value' => 'casa',
      ]
    ]],
    'position' => 'normal',
    'style' => 'default',
  ]);
}
add_action('acf/init', 'csamba_register_acf_fields');

function csamba_menu_link_color(array $atts, WP_Post $item, stdClass $args): array
{
  if (($args->theme_location ?? '') !== 'primary' || !function_exists('get_field'))
    return $atts;
  $color = get_field('csamba_menu_color', $item);
  if ($color) {
    $atts['style'] = trim(($atts['style'] ?? '') . ';--menu-accent:' . sanitize_hex_color($color));
  }
  return $atts;
}
add_filter('nav_menu_link_attributes', 'csamba_menu_link_color', 10, 3);

function csamba_upcoming_events(int $limit = 8): WP_Query
{
  $today = current_time('Ymd');
  return new WP_Query([
    'post_type' => 'evento',
    'posts_per_page' => $limit,
    'meta_key' => 'evento_data',
    'orderby' => 'meta_value_num',
    'order' => 'ASC',
    'meta_query' => [
      [
        'key' => 'evento_data',
        'value' => $today,
        'compare' => '>=',
        'type' => 'NUMERIC',
      ]
    ],
  ]);
}

function csamba_excerpt(int $words = 24): string
{
  return wp_trim_words(get_the_excerpt() ?: wp_strip_all_tags(get_the_content()), $words);
}

function csamba_placeholder(string $label = 'CSamba'): string
{
  return 'https://placehold.co/900x560/e8e8e8/222?text=' . rawurlencode($label);
}

function csamba_image_url($post_id = null, string $size = 'large', string $fallback = 'CSamba'): string
{
  $post_id = $post_id ?: get_the_ID();
  $url = get_the_post_thumbnail_url($post_id, $size);
  return $url ?: csamba_placeholder($fallback);
}

function csamba_band_gallery(int $post_id): array
{
  if (!function_exists('get_field'))
    return [];
  $images = [];
  for ($i = 1; $i <= 8; $i++) {
    $id = (int) get_field('banda_foto_' . $i, $post_id);
    if ($id)
      $images[] = $id;
  }
  return array_values(array_unique($images));
}

function csamba_band_tracks(int $post_id): array
{
  if (!function_exists('get_field'))
    return [];
  $items = [];
  for ($i = 1; $i <= 6; $i++) {
    $title = trim((string) get_field('banda_musica_titulo_' . $i, $post_id));
    $url = trim((string) get_field('banda_musica_url_' . $i, $post_id));
    if ($title || $url)
      $items[] = ['title' => $title ?: 'Ouvir música', 'url' => $url];
  }
  return $items;
}

function csamba_youtube_id(string $url): string
{
  if (!$url)
    return '';
  $patterns = [
    '~youtu\\.be/([A-Za-z0-9_-]{6,})~',
    '~youtube\\.com/watch\\?[^#]*v=([A-Za-z0-9_-]{6,})~',
    '~youtube\\.com/(?:embed|shorts)/([A-Za-z0-9_-]{6,})~',
  ];
  foreach ($patterns as $pattern) {
    if (preg_match($pattern, $url, $m))
      return $m[1];
  }
  return '';
}

function csamba_band_clips(int $post_id): array
{
  if (!function_exists('get_field'))
    return [];
  $items = [];
  for ($i = 1; $i <= 6; $i++) {
    $title = trim((string) get_field('banda_clipe_titulo_' . $i, $post_id));
    $url = trim((string) get_field('banda_clipe_url_' . $i, $post_id));
    $thumb_id = (int) get_field('banda_clipe_thumb_' . $i, $post_id);
    if (!$url && !$title && !$thumb_id)
      continue;
    $video_id = csamba_youtube_id($url);
    $thumb = $thumb_id ? wp_get_attachment_image_url($thumb_id, 'csamba-card') : ($video_id ? 'https://i.ytimg.com/vi/' . rawurlencode($video_id) . '/hqdefault.jpg' : '');
    $items[] = ['title' => $title ?: 'Assistir clipe', 'url' => $url, 'thumb' => $thumb, 'youtube_id' => $video_id];
  }
  return $items;
}

function csamba_date_label($post_id = null): string
{
  $post_id = $post_id ?: get_the_ID();
  return get_the_date('j \d\e F \d\e Y', $post_id);
}

/** Retorna os destaques editoriais do Swiper. Cada item pode apontar para qualquer conteúdo público suportado. */
function csamba_featured_items(int $limit = 7): array
{
  return get_posts([
    'post_type' => 'destaque',
    'post_status' => 'publish',
    'posts_per_page' => $limit,
    'orderby' => ['menu_order' => 'ASC', 'date' => 'DESC'],
  ]);
}


/**
 * Converte uma cor HEX para HSL.
 * Retorna H em graus (0-360) e S/L em escala 0-1.
 */
function csamba_hex_to_hsl(string $hex): array
{
  $hex = ltrim($hex, '#');

  if (strlen($hex) === 3) {
    $hex = $hex[0] . $hex[0] . $hex[1] . $hex[1] . $hex[2] . $hex[2];
  }

  if (!preg_match('/^[0-9a-fA-F]{6}$/', $hex)) {
    $hex = '2878d7';
  }

  $r = hexdec(substr($hex, 0, 2)) / 255;
  $g = hexdec(substr($hex, 2, 2)) / 255;
  $b = hexdec(substr($hex, 4, 2)) / 255;

  $max = max($r, $g, $b);
  $min = min($r, $g, $b);
  $delta = $max - $min;

  $h = 0.0;
  $l = ($max + $min) / 2;
  $s = 0.0;

  if ($delta > 0) {
    $s = $l > 0.5
      ? $delta / (2 - $max - $min)
      : $delta / ($max + $min);

    if ($max === $r) {
      $h = (($g - $b) / $delta) + ($g < $b ? 6 : 0);
    } elseif ($max === $g) {
      $h = (($b - $r) / $delta) + 2;
    } else {
      $h = (($r - $g) / $delta) + 4;
    }

    $h *= 60;
  }

  return [
    'h' => $h,
    's' => $s,
    'l' => $l,
  ];
}

/** Auxiliar da conversão HSL -> RGB. */
function csamba_hue_to_rgb(float $p, float $q, float $t): float
{
  if ($t < 0)
    $t += 1;
  if ($t > 1)
    $t -= 1;

  if ($t < 1 / 6)
    return $p + ($q - $p) * 6 * $t;
  if ($t < 1 / 2)
    return $q;
  if ($t < 2 / 3)
    return $p + ($q - $p) * (2 / 3 - $t) * 6;

  return $p;
}

/** Converte HSL para HEX. */
function csamba_hsl_to_hex(float $h, float $s, float $l): string
{
  $h = fmod($h, 360);
  if ($h < 0)
    $h += 360;

  $h /= 360;

  if ($s == 0) {
    $r = $g = $b = $l;
  } else {
    $q = $l < 0.5
      ? $l * (1 + $s)
      : $l + $s - ($l * $s);

    $p = 2 * $l - $q;

    $r = csamba_hue_to_rgb($p, $q, $h + 1 / 3);
    $g = csamba_hue_to_rgb($p, $q, $h);
    $b = csamba_hue_to_rgb($p, $q, $h - 1 / 3);
  }

  return sprintf(
    '#%02X%02X%02X',
    max(0, min(255, (int) round($r * 255))),
    max(0, min(255, (int) round($g * 255))),
    max(0, min(255, (int) round($b * 255)))
  );
}

/**
 * Gera uma cor análoga deslocando o matiz.
 * 20 graus produz um resultado próximo ao exemplo do Adobe Color.
 */
function csamba_analog_color(string $hex, float $offset = 20): string
{
  $hsl = csamba_hex_to_hsl($hex);

  return csamba_hsl_to_hex(
    $hsl['h'] + $offset,
    $hsl['s'],
    $hsl['l']
  );
}

function csamba_featured_data(WP_Post $featured): ?array
{
  if (!function_exists('get_field'))
    return null;

  $target_id = (int) get_field('csamba_target', $featured->ID);
  if (!$target_id || get_post_status($target_id) !== 'publish')
    return null;

  $target = get_post($target_id);
  if (!$target)
    return null;

  $image_id = (int) get_field('csamba_slide_image', $featured->ID);
  $image = $image_id ? wp_get_attachment_image_url($image_id, 'csamba-hero') : get_the_post_thumbnail_url($target_id, 'csamba-hero');

  $subtitle = (string) get_field('csamba_subtitulo', $featured->ID);
  $descricao = (string) get_field('csamba_descricao', $featured->ID);
  $color = sanitize_hex_color((string) get_field('csamba_slide_color', $featured->ID)) ?: '#2878d7';
  $use_gradient = (bool) get_field('csamba_slide_gradient', $featured->ID);
  $analog_color = $use_gradient ? csamba_analog_color($color, 20) : $color;
  $background = $use_gradient
    ? sprintf('linear-gradient(160deg, %s 0%%, %s 100%%)', $color, $analog_color)
    : $color;
  $cta = trim((string) get_field('csamba_cta', $featured->ID)) ?: 'Veja mais';

  return [
    'target_id' => $target_id,
    'title' => get_the_title($target_id),
    'subtitle' => $subtitle,
    'descricao' => $descricao,
    'excerpt' => wp_trim_words(get_the_excerpt($target_id) ?: wp_strip_all_tags($target->post_content), 30),
    'url' => get_permalink($target_id),
    'image' => $image ?: csamba_placeholder(get_the_title($target_id)),
    'color' => $color,
    'use_gradient' => $use_gradient,
    'analog_color' => $analog_color,
    'background' => $background,
    'cta' => $cta,
    'type' => get_post_type($target_id),
  ];
}



function csamba_acf_admin_notice(): void
{
  if (!current_user_can('activate_plugins') || function_exists('get_field'))
    return;
  echo '<div class="notice notice-warning"><p><strong>CSamba:</strong> instale e ative o plugin Advanced Custom Fields (ACF) para exibir os campos de Banda, Evento, Destaque e cores do menu.</p></div>';
}
add_action('admin_notices', 'csamba_acf_admin_notice');