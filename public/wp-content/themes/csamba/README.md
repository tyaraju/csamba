# CSamba Theme v0.3

Tema WordPress tradicional (sem Bedrock) com frontend preparado para Vite + Tailwind + Vanilla JS + Swiper.

## Destaques do Swiper

O Swiper deixou de ser vinculado a Bandas. O painel agora possui o CPT **Destaques**. Cada Destaque é um item editorial que aponta, via ACF, para qualquer um destes conteúdos:

- Post/notícia
- Página
- Banda
- Casa
- Evento
- Coluna

Cada item de destaque possui: conteúdo de destino, cor, subtítulo opcional, imagem alternativa e texto do CTA. A ordem pode ser controlada pelo atributo **Ordem** do próprio Destaque.

Isso permite, por exemplo, colocar `Cadastre sua banda` no mesmo Swiper de uma notícia, evento ou banda sem duplicar conteúdo.

## ACF

Os CPTs não dependem do ACF para existir — eles são registrados pelo tema em `functions.php` usando a API nativa do WordPress.

O **ACF Free** é usado para os metadados editoriais que não pertencem ao editor padrão, principalmente:

- cor de cada item do menu principal;
- configuração do Destaque/Swiper;
- data e horário do Evento;
- relacionamento Evento → Banda;
- relacionamento Evento → Casa;
- cidade e link de ingressos.

Não é necessário ACF Pro nesta versão.

## Cadastre sua banda

Foi incluído o template `Cadastre sua banda`. Crie uma Página no WordPress, escolha esse template e construa o conteúdo/formulário pelo editor. Ela também pode ser selecionada como destino de um Destaque do Swiper.

## Frontend

- Flexbox e layout máximo de 1280px
- Tailwind preparado no `src/`
- CSS final em `assets/css/main.css`
- Vanilla JS
- Swiper 11
- Vite preparado para build
- fonte ITC Avant Garde esperada em `assets/fonts/itcavantgardegothicltbold.ttf`
