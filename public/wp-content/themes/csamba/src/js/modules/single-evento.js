function initEventPage() {
  const page = document.querySelector('.event-single');

  if (!page || page.dataset.initialized === 'true') return;

  page.dataset.initialized = 'true';

  const nav = page.querySelector('.event-section-nav');
  const shareButton = page.querySelector('[data-event-share]');
  const copyButton = page.querySelector('[data-event-copy]');
  const status = page.querySelector('[data-event-share-status]');

  const title = page.dataset.eventTitle || document.title;
  const url = page.dataset.eventUrl || window.location.href;

  /* Compartilhamento */

  if (shareButton && typeof navigator.share === 'function') {
    shareButton.hidden = false;

    shareButton.addEventListener('click', async () => {
      try {
        await navigator.share({ title, url });
      } catch (error) {
        if (error.name !== 'AbortError' && status) {
          status.textContent =
            'Não foi possível compartilhar. Use os outros canais disponíveis.';
        }
      }
    });
  }

  if (copyButton && navigator.clipboard?.writeText) {
    copyButton.hidden = false;

    copyButton.addEventListener('click', async () => {
      try {
        await navigator.clipboard.writeText(url);

        if (status) {
          status.textContent = 'Link do evento copiado.';
        }
      } catch {
        if (status) {
          status.textContent =
            'Não foi possível copiar. Copie o endereço na barra do navegador.';
        }
      }
    });
  }

  /* Navegação interna */

  if (!nav) return;

  const items = [...nav.querySelectorAll('a[href^="#"]')]
    .map((link) => ({
      link,
      section: document.getElementById(
        link.getAttribute('href').slice(1)
      ),
    }))
    .filter(({ section }) => section);

  if (!items.length) return;

  function update() {
    const navHeight = nav.getBoundingClientRect().height;

    page.style.setProperty(
      '--cs-event-nav-height',
      `${Math.ceil(navHeight)}px`
    );

    const threshold = window.innerHeight * 0.3;
    let active = items[0];

    items.forEach((item) => {
      if (item.section.getBoundingClientRect().top <= threshold) {
        active = item;
      }
    });

    items.forEach(({ link }) => {
      if (link === active.link) {
        link.setAttribute('aria-current', 'location');
      } else {
        link.removeAttribute('aria-current');
      }
    });
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
  window.addEventListener('hashchange', scheduleUpdate);
  window.addEventListener('load', scheduleUpdate, { once: true });

  if ('ResizeObserver' in window) {
    const observer = new ResizeObserver(scheduleUpdate);
    observer.observe(page);
    observer.observe(nav);
  }

  update();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initEventPage, {
    once: true,
  });
} else {
  initEventPage();
}