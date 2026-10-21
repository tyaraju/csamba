function initAgendaArchive() {
  const page = document.querySelector('.agenda-archive');

  if (!page || page.dataset.initialized === 'true') return;

  page.dataset.initialized = 'true';

  const trigger = page.querySelector('[data-agenda-pick-date]');
  const calendar = page.querySelector('#agenda-date-picker');
  const input = page.querySelector('#agenda-custom-date');

  if (!trigger || !calendar || !input) return;

  trigger.addEventListener('click', (event) => {
    if (
      event.ctrlKey ||
      event.metaKey ||
      event.shiftKey ||
      event.altKey
    ) {
      return;
    }

    event.preventDefault();

    calendar.scrollIntoView({
      block: 'start',
      behavior: window.matchMedia(
        '(prefers-reduced-motion: reduce)'
      ).matches
        ? 'auto'
        : 'smooth',
    });

    input.focus({ preventScroll: true });

    if (typeof input.showPicker === 'function') {
      try {
        input.showPicker();
      } catch {
        // O campo de data continua utilizável normalmente.
      }
    }
  });
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initAgendaArchive, {
    once: true,
  });
} else {
  initAgendaArchive();
}