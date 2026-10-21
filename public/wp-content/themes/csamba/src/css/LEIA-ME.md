# CSS organizado do CSamba

## Instalação

1. Faça uma cópia de segurança do theme.css atual.
2. Extraia o pacote. Copie theme.css e as pastas base, components e pages para a mesma pasta onde hoje está seu theme.css.
3. Mantenha a importação de theme.css que já existe no Vite/main.js. Não importe também o arquivo antigo.
4. Mantenha a pasta fonts na posição atual: um nível acima da pasta que contém theme.css. Os caminhos em base/fonts.css já foram ajustados para isso.
5. Reinicie o Vite e confira home, arquivos e singles em desktop e celular. Para produção, execute o comando de build já utilizado no projeto.

Não substitua a entrada do Tailwind nem as configurações do PostCSS/Vite. Este pacote substitui somente o theme.css enviado.

## Organização e compatibilidade

Foram preservadas todas as 8.409 linhas originais, sua ordem e suas declarações. A única alteração de conteúdo é o caminho relativo das três fontes, necessário pela mudança de pasta. A recomposição dos trechos foi comparada ao original e é idêntica antes desse ajuste. Também foram verificados os fechamentos dos blocos em cada arquivo.

O arquivo pages/bandas-legado.css contém estilos antigos de bandas e regras responsivas compartilhadas. Ele continua importado porque não temos todos os templates para comprovar quais seletores podem ser removidos. O nome não significa que possa ser excluído.

pages/single-casa-form.css contém as sobrescritas do layout com formulário e a integração do menu fixo. Deve vir depois de single-casa.css.

components/header.css inclui o menu compacto e as regras compartilhadas de navegação fixa. A sequência dos imports mantém a prioridade original, mesmo quando um arquivo contém seletores de outras páginas.

## Próximas alterações

Edite os arquivos das respectivas páginas. Os breakpoints permanecem junto das regras a que pertencem. Evite acrescentar novos ajustes ao theme.css: ele deve continuar sendo apenas a entrada dos imports.

Esta etapa organiza o código sem reduzir o tamanho total entregue ao navegador. Não foram removidas sobrescritas, regras duplicadas ou seletores potencialmente usados. Não houve teste visual no WordPress nem build do tema, pois os demais arquivos do projeto não foram enviados.
