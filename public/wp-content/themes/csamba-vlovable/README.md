# Tema CSamba (WordPress)

Tema clássico com Home, Archive de Bandas e PDP da Banda, baseado nos layouts enviados, com visual modernizado e responsivo.

## Instalação no Local App

1. Copie a pasta `csamba/` para `wp-content/themes/` do seu site no Local.
2. Em **Aparência > Temas**, ative **CSamba**.
3. Em **Configurações > Links permanentes**, clique em Salvar (regrava as URLs dos CPTs).
4. Em **Aparência > Menus**, crie um menu e atribua às posições "Menu principal" e (opcional) "Menu do topo".
5. Em **Configurações > Leitura**, defina uma página estática como página inicial (o `front-page.php` é usado automaticamente).

## Estrutura de conteúdo

| Post type | Slug | Campos próprios |
|---|---|---|
| `banda` | /bandas | prefixo do nome, cidade, rádio, site, redes, galeria (IDs), destaque |
| `casa` | /casas | endereço, cidade, telefone, destaque |
| `evento` | /agenda | data, horário, banda, casa |
| `coluna` | /colunas | assinatura + taxonomia `editoria` |
| `musica` | /musicas | banda, URL do áudio |
| `letra` | /letras | banda |
| `post` | nativo | banda relacionada, destaque na home |

Taxonomias: `estilo` (bandas e músicas) e `editoria` (colunas).

## Templates

- `front-page.php` — destaques, casas, bandas em destaque, novidades, agenda, cards promo e colunas.
- `archive-banda.php` — banda em destaque + listagem A a Z com filtro de busca.
- `single-banda.php` — hero com abas (a banda, músicas, letras, fotos, rádio), tiles de Fotos/Rádio/Letras, novidades e agenda da banda.
- `archive.php`, `single.php`, `page.php`, `search.php`, `404.php`, `index.php` — apoio.
- `template-parts/` — cards de notícia, card de banda, agenda e cards promocionais.

## Personalização

- Cores, raio e tipografia ficam em variáveis CSS no topo de `assets/css/main.css` (`--brand`, `--ink`, `--radius`...).
- Os ícones e o logo são SVG inline em `inc/template-tags.php` (`csamba_logo_mark()`, `csamba_icon()`).
- O JS (`assets/js/main.js`) cuida do menu mobile, abas da PDP e filtro do A-Z.

## Conteúdo para testar

Cadastre pelo menos: 3 bandas (uma marcada como destaque), 1 casa, alguns eventos com data futura, 3 colunas e 4 notícias.
