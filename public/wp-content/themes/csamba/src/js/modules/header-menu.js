function initHeaderMenu() {
  const header = document.querySelector('.site-header--modern');
  const button = header?.querySelector('[data-csamba-menu-toggle]');
  const navigation = header?.querySelector('#csamba-navigation');

  if (!header || !button || !navigation) return;
  if (button.dataset.menuInitialized === 'true') return;

  button.dataset.menuInitialized = 'true';

  const mobile = window.matchMedia('(max-width: 1000px)');

  function isOpen() {
    return button.getAttribute('aria-expanded') === 'true';
  }

  function setOpen(open, restoreFocus = false) {
    button.setAttribute('aria-expanded', String(open));

    button.setAttribute(
      'aria-label',
      open ? 'Fechar menu principal' : 'Abrir menu principal'
    );

    header.classList.toggle('is-menu-open', open);

    if (restoreFocus) {
      button.focus({ preventScroll: true });
    }
  }

  button.addEventListener('click', () => {
    setOpen(!isOpen());
  });

  navigation.addEventListener('click', (event) => {
    if (event.target.closest('a')) {
      setOpen(false);
    }
  });

  document.addEventListener('click', (event) => {
    if (
      !isOpen()
      || navigation.contains(event.target)
      || button.contains(event.target)
    ) {
      return;
    }

    setOpen(false);
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && isOpen()) {
      setOpen(false, true);
    }
  });

  // Fecha quando o foco sai da navegação pelo teclado.
  header.addEventListener('focusout', () => {
    requestAnimationFrame(() => {
      if (
        isOpen()
        && !navigation.contains(document.activeElement)
        && document.activeElement !== button
      ) {
        setOpen(false);
      }
    });
  });

  mobile.addEventListener('change', () => {
    setOpen(false);
  });

  setOpen(false);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initHeaderMenu, {
    once: true,
  });
} else {
  initHeaderMenu();
}