function initBandLightbox() {
  const page = document.querySelector('.band-single');
  const dialog = page?.querySelector('.band-lightbox');

  if (!dialog || dialog.dataset.initialized === 'true') return;
  if (typeof dialog.showModal !== 'function') return;

  dialog.dataset.initialized = 'true';

  const image = dialog.querySelector('.band-lightbox__image');
  const closeButton = dialog.querySelector('.band-lightbox__close');

  let trigger = null;

  page.querySelectorAll('[data-band-photo]').forEach((link) => {
    link.addEventListener('click', (event) => {
      // Mantém Ctrl/Cmd + clique para abrir o arquivo diretamente.
      if (
        event.ctrlKey ||
        event.metaKey ||
        event.shiftKey ||
        event.altKey
      ) {
        return;
      }

      event.preventDefault();
      trigger = link;

      const thumbnail = link.querySelector('img');

      image.alt = thumbnail?.alt || 'Foto ampliada da banda';
      image.src = link.href;

      dialog.showModal();
      document.documentElement.classList.add('band-lightbox-open');
    });
  });

  closeButton.addEventListener('click', () => dialog.close());

  // Fecha ao clicar no fundo, preservando cliques na foto.
  dialog.addEventListener('click', (event) => {
    if (event.target === dialog) {
      dialog.close();
    }
  });

  // Também executado quando o usuário fecha com Esc.
  dialog.addEventListener('close', () => {
    document.documentElement.classList.remove('band-lightbox-open');
    image.removeAttribute('src');
    image.alt = '';

    trigger?.focus({ preventScroll: true });
  });
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initBandLightbox);
} else {
  initBandLightbox();
}