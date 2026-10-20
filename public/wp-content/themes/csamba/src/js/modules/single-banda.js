function initBandLightbox() {
  const page = document.querySelector('.band-single');
  const dialog = page?.querySelector('.band-lightbox');

  if (!dialog || dialog.dataset.initialized === 'true') return;
  if (typeof dialog.showModal !== 'function') return;

  const image = dialog.querySelector('.band-lightbox__image');
  const closeButton = dialog.querySelector('.band-lightbox__close');

  if (!image || !closeButton) return;

  dialog.dataset.initialized = 'true';

  let trigger = null;

  page.querySelectorAll('[data-band-photo]').forEach((link) => {
    link.addEventListener('click', (event) => {
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
      image.alt = link.querySelector('img')?.alt
        || 'Foto ampliada da banda';
      image.src = link.href;

      dialog.showModal();

      document.documentElement.classList.add(
        'band-lightbox-open'
      );
    });
  });

  closeButton.addEventListener('click', () => {
    dialog.close();
  });

  dialog.addEventListener('click', (event) => {
    if (event.target === dialog) {
      dialog.close();
    }
  });

  dialog.addEventListener('close', () => {
    document.documentElement.classList.remove(
      'band-lightbox-open'
    );

    image.removeAttribute('src');
    image.alt = '';

    trigger?.focus({ preventScroll: true });
  });
}

function initBandSectionNav() {
  const page = document.querySelector('.band-single');
  const nav = page?.querySelector('.band-single__nav');

  if (!nav || nav.dataset.initialized === 'true') return;

  const items = [...nav.querySelectorAll('a[href^="#"]')]
    .map((link) => ({
      link,
      section: document.getElementById(
        link.getAttribute('href').slice(1)
      ),
    }))
    .filter(({ section }) => section);

  if (!items.length) return;

  nav.dataset.initialized = 'true';

  function activate(link) {
    items.forEach((item) => {
      if (item.link === link) {
        item.link.setAttribute('aria-current', 'location');
      } else {
        item.link.removeAttribute('aria-current');
      }
    });
  }

  function update() {
    const threshold = window.innerHeight * 0.3;
    let active = items[0];

    items.forEach((item) => {
      if (
        item.section.getBoundingClientRect().top <= threshold
      ) {
        active = item;
      }
    });

    activate(active.link);
  }

  let scheduled = false;

  function scheduleUpdate() {
    if (scheduled) return;

    scheduled = true;

    requestAnimationFrame(() => {
      update();
      scheduled = false;
    });
  }

  window.addEventListener('scroll', scheduleUpdate, {
    passive: true,
  });

  window.addEventListener('resize', scheduleUpdate);
  window.addEventListener('load', scheduleUpdate, {
    once: true,
  });

  window.addEventListener('hashchange', scheduleUpdate);

  // Atualiza também quando imagens alteram a altura das seções.
  if ('ResizeObserver' in window) {
    const observer = new ResizeObserver(scheduleUpdate);
    observer.observe(page);
  }

  update();
}

function initBandPage() {
  initBandLightbox();
  initBandSectionNav();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initBandPage, {
    once: true,
  });
} else {
  initBandPage();
}