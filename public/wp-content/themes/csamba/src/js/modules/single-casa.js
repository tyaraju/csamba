function initCasaGallery() {
  const page = document.querySelector('.single-casa');

  if (!page || page.dataset.galleryInitialized === 'true') return;

  const dialog = page.querySelector('.casa-lightbox');
  const photos = [...page.querySelectorAll('[data-casa-photo]')];

  // Sem suporte ao modal, os links continuam abrindo as imagens.
  if (!dialog || !photos.length || typeof dialog.showModal !== 'function') {
    return;
  }

  page.dataset.galleryInitialized = 'true';

  const image = dialog.querySelector('[data-casa-photo-image]');
  const caption = dialog.querySelector('[data-casa-photo-caption]');
  const count = dialog.querySelector('[data-casa-photo-count]');
  const close = dialog.querySelector('[data-casa-photo-close]');
  const previous = dialog.querySelector('[data-casa-photo-prev]');
  const next = dialog.querySelector('[data-casa-photo-next]');

  let current = 0;
  let trigger = null;

  function show(index) {
    current = (index + photos.length) % photos.length;

    const photo = photos[current];

    image.src = photo.href;
    image.alt = photo.querySelector('img')?.alt || '';

    caption.textContent = photo.dataset.caption || '';
    count.textContent = `${current + 1} de ${photos.length}`;
  }

  photos.forEach((photo, index) => {
    photo.addEventListener('click', (event) => {
      // Mantém Ctrl/Cmd + clique para abrir a imagem em outra aba.
      if (
        event.ctrlKey ||
        event.metaKey ||
        event.shiftKey ||
        event.altKey
      ) {
        return;
      }

      event.preventDefault();

      trigger = photo;
      show(index);

      dialog.showModal();
      document.documentElement.classList.add('casa-modal-open');
    });
  });

  close.addEventListener('click', () => dialog.close());

  previous.addEventListener('click', () => show(current - 1));
  next.addEventListener('click', () => show(current + 1));

  previous.hidden = photos.length < 2;
  next.hidden = photos.length < 2;

  dialog.addEventListener('keydown', (event) => {
    if (event.key === 'ArrowLeft') {
      event.preventDefault();
      show(current - 1);
    }

    if (event.key === 'ArrowRight') {
      event.preventDefault();
      show(current + 1);
    }
  });

  // Fecha ao clicar fora da caixa do modal.
  dialog.addEventListener('click', (event) => {
    if (event.target !== dialog) return;

    const bounds = dialog.getBoundingClientRect();

    const outside =
      event.clientX < bounds.left ||
      event.clientX > bounds.right ||
      event.clientY < bounds.top ||
      event.clientY > bounds.bottom;

    if (outside) dialog.close();
  });

  // Também executado quando o usuário fecha com Esc.
  dialog.addEventListener('close', () => {
    document.documentElement.classList.remove('casa-modal-open');
    image.removeAttribute('src');
    trigger?.focus();
  });
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initCasaGallery, {
    once: true,
  });
} else {
  initCasaGallery();
}
function initCasaSectionNav() {
  const nav = document.querySelector(
    '.single-casa .casa-section-nav'
  );

  if (!nav || nav.dataset.initialized === 'true') return;

  nav.dataset.initialized = 'true';

  const links = [...nav.querySelectorAll('a[href^="#"]')];

  const items = links
    .map((link) => ({
      link,
      section: document.getElementById(
        link.getAttribute('href').slice(1)
      ),
    }))
    .filter((item) => item.section);

  if (!items.length) return;

  function activate(activeLink) {
    items.forEach(({ link }) => {
      if (link === activeLink) {
        link.setAttribute('aria-current', 'location');
      } else {
        link.removeAttribute('aria-current');
      }
    });
  }

  function update() {
    const threshold = window.innerHeight * 0.3;
    let active = items[0];

    items.forEach((item) => {
      if (item.section.getBoundingClientRect().top <= threshold) {
        active = item;
      }
    });

    activate(active.link);
  }

  let scheduled = false;

  window.addEventListener('scroll', () => {
    if (scheduled) return;

    scheduled = true;

    requestAnimationFrame(() => {
      update();
      scheduled = false;
    });
  }, { passive: true });

  window.addEventListener('resize', update);

  update();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initCasaSectionNav, {
    once: true,
  });
} else {
  initCasaSectionNav();
}