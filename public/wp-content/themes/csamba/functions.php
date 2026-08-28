<?php
if (!defined('ABSPATH')) exit;

define('CSAMBA_VERSION', '0.3.0');

function csamba_setup(): void {
    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
    add_theme_support('responsive-embeds');
    add_theme_support('html5', ['search-form','gallery','caption','style','script']);
    add_image_size('csamba-card', 520, 320, true);
    add_image_size('csamba-hero', 980, 620, true);
    add_image_size('csamba-thumb', 240, 160, true);
    register_nav_menus([
        'primary' => 'Menu principal',
        'band'    => 'Menu da banda',
    ]);
}
add_action('after_setup_theme', 'csamba_setup');

function csamba_assets(): void {
    // Swiper local pode ser incorporado pelo Vite depois; por enquanto, CDN estável e cacheável.
    wp_enqueue_style('swiper', 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css', [], '11');
    wp_enqueue_style('csamba-main', get_template_directory_uri() . '/assets/css/main.css', ['swiper'], CSAMBA_VERSION);
    wp_enqueue_script('swiper', 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js', [], '11', true);
    wp_enqueue_script('csamba-main', get_template_directory_uri() . '/assets/js/main.js', ['swiper'], CSAMBA_VERSION, true);
}
add_action('wp_enqueue_scripts', 'csamba_assets');

function csamba_register_content_types(): void {
    $types = [
        'banda'  => ['Bandas','Banda','dashicons-groups', true],
        'casa'   => ['Casas','Casa','dashicons-admin-home', true],
        'evento' => ['Agenda','Evento','dashicons-calendar-alt', true],
        'coluna' => ['Colunas','Coluna','dashicons-welcome-write-blog', true],
        'destaque' => ['Destaques','Destaque','dashicons-star-filled', false],
    ];
    foreach ($types as $slug => [$plural,$singular,$icon,$archive]) {
        register_post_type($slug, [
            'labels' => [
                'name'=>$plural,
                'singular_name'=>$singular,
                'add_new_item'=>"Adicionar $singular",
                'edit_item'=>"Editar $singular"
            ],
            'public' => true,
            'has_archive' => $archive,
            'rewrite' => ['slug' => $slug === 'banda' ? 'bandas' : ($slug === 'evento' ? 'agenda' : $slug)],
            'menu_icon' => $icon,
            'supports' => $slug === 'destaque' ? ['title','page-attributes'] : ['title','editor','excerpt','thumbnail'],
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
function csamba_register_acf_fields(): void {
    if (!function_exists('acf_add_local_field_group')) return;

    acf_add_local_field_group([
        'key' => 'group_csamba_menu',
        'title' => 'CSamba — Menu',
        'fields' => [[
            'key' => 'field_csamba_menu_color',
            'label' => 'Cor do item',
            'name' => 'csamba_menu_color',
            'type' => 'color_picker',
            'default_value' => '#2878d7',
        ]],
        'location' => [[['param'=>'nav_menu_item','operator'=>'==','value'=>'all']]],
    ]);

    acf_add_local_field_group([
        'key' => 'group_csamba_destaque',
        'title' => 'CSamba — Destaque do Swiper',
        'fields' => [
            [
                'key'=>'field_csamba_target',
                'label'=>'Conteúdo destacado',
                'name'=>'csamba_target',
                'type'=>'post_object',
                'post_type'=>['post','page','banda','casa','evento','coluna'],
                'return_format'=>'id',
                'required'=>1,
                'ui'=>1,
            ],
            ['key'=>'field_csamba_slide_color','label'=>'Cor do botão / destaque','name'=>'csamba_slide_color','type'=>'color_picker','default_value'=>'#2878d7'],
            ['key'=>'field_csamba_subtitulo','label'=>'Subtítulo opcional','name'=>'csamba_subtitulo','type'=>'text'],
            ['key'=>'field_csamba_slide_image','label'=>'Imagem alternativa do slide','name'=>'csamba_slide_image','type'=>'image','return_format'=>'id','preview_size'=>'medium'],
            ['key'=>'field_csamba_cta','label'=>'Texto do botão','name'=>'csamba_cta','type'=>'text','default_value'=>'Veja mais'],
        ],
        'location' => [[['param'=>'post_type','operator'=>'==','value'=>'destaque']]],
    ]);

    acf_add_local_field_group([
        'key' => 'group_csamba_evento',
        'title' => 'CSamba — Evento / Agenda',
        'fields' => [
            ['key'=>'field_evento_data','label'=>'Data','name'=>'evento_data','type'=>'date_picker','display_format'=>'d/m/Y','return_format'=>'Ymd','required'=>1],
            ['key'=>'field_evento_hora','label'=>'Horário','name'=>'evento_hora','type'=>'time_picker','display_format'=>'H:i','return_format'=>'H:i'],
            ['key'=>'field_evento_banda','label'=>'Banda','name'=>'evento_banda','type'=>'post_object','post_type'=>['banda'],'return_format'=>'id','allow_null'=>1],
            ['key'=>'field_evento_casa','label'=>'Casa / Local','name'=>'evento_casa','type'=>'post_object','post_type'=>['casa'],'return_format'=>'id','allow_null'=>1],
            ['key'=>'field_evento_cidade','label'=>'Cidade','name'=>'evento_cidade','type'=>'text'],
            ['key'=>'field_evento_ingresso','label'=>'Link de ingressos','name'=>'evento_ingresso','type'=>'url'],
        ],
        'location' => [[['param'=>'post_type','operator'=>'==','value'=>'evento']]],
    ]);
}
add_action('acf/init', 'csamba_register_acf_fields');

function csamba_menu_link_color(array $atts, WP_Post $item, stdClass $args): array {
    if (($args->theme_location ?? '') !== 'primary' || !function_exists('get_field')) return $atts;
    $color = get_field('csamba_menu_color', $item);
    if ($color) {
        $atts['style'] = trim(($atts['style'] ?? '') . ';--menu-accent:' . sanitize_hex_color($color));
    }
    return $atts;
}
add_filter('nav_menu_link_attributes', 'csamba_menu_link_color', 10, 3);

function csamba_upcoming_events(int $limit = 8): WP_Query {
    $today = current_time('Ymd');
    return new WP_Query([
        'post_type' => 'evento',
        'posts_per_page' => $limit,
        'meta_key' => 'evento_data',
        'orderby' => 'meta_value_num',
        'order' => 'ASC',
        'meta_query' => [[
            'key' => 'evento_data',
            'value' => $today,
            'compare' => '>=',
            'type' => 'NUMERIC',
        ]],
    ]);
}

function csamba_excerpt(int $words = 24): string {
    return wp_trim_words(get_the_excerpt() ?: wp_strip_all_tags(get_the_content()), $words);
}

function csamba_placeholder(string $label='CSamba'): string {
    return 'https://placehold.co/900x560/e8e8e8/222?text=' . rawurlencode($label);
}

function csamba_image_url($post_id = null, string $size='large', string $fallback='CSamba'): string {
    $post_id = $post_id ?: get_the_ID();
    $url = get_the_post_thumbnail_url($post_id, $size);
    return $url ?: csamba_placeholder($fallback);
}

function csamba_date_label($post_id = null): string {
    $post_id = $post_id ?: get_the_ID();
    return get_the_date('j \d\e F \d\e Y', $post_id);
}

/** Retorna os destaques editoriais do Swiper. Cada item pode apontar para qualquer conteúdo público suportado. */
function csamba_featured_items(int $limit = 7): array {
    return get_posts([
        'post_type' => 'destaque',
        'post_status' => 'publish',
        'posts_per_page' => $limit,
        'orderby' => ['menu_order' => 'ASC', 'date' => 'DESC'],
    ]);
}

function csamba_featured_data(WP_Post $featured): ?array {
    if (!function_exists('get_field')) return null;

    $target_id = (int) get_field('csamba_target', $featured->ID);
    if (!$target_id || get_post_status($target_id) !== 'publish') return null;

    $target = get_post($target_id);
    if (!$target) return null;

    $image_id = (int) get_field('csamba_slide_image', $featured->ID);
    $image = $image_id ? wp_get_attachment_image_url($image_id, 'csamba-hero') : get_the_post_thumbnail_url($target_id, 'csamba-hero');

    $subtitle = (string) get_field('csamba_subtitulo', $featured->ID);
    $color = sanitize_hex_color((string) get_field('csamba_slide_color', $featured->ID)) ?: '#2878d7';
    $cta = trim((string) get_field('csamba_cta', $featured->ID)) ?: 'Veja mais';

    return [
        'target_id' => $target_id,
        'title' => get_the_title($target_id),
        'subtitle' => $subtitle,
        'excerpt' => wp_trim_words(get_the_excerpt($target_id) ?: wp_strip_all_tags($target->post_content), 30),
        'url' => get_permalink($target_id),
        'image' => $image ?: csamba_placeholder(get_the_title($target_id)),
        'color' => $color,
        'cta' => $cta,
        'type' => get_post_type($target_id),
    ];
}

