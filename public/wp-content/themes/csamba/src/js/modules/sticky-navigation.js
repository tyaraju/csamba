function initStickyNavigation() {
  const slot = document.querySelector('.nav-slot');
  const shell = slot?.querySelector('.nav-shell');

  if (!slot || !shell || slot.dataset.initialized === 'true') {
    return;
  }

  slot.dataset.initialized = 'true';

  const root = document.documentElement;
  const adminBar = document.getElementById('wpadminbar');

  const bandNav = document.querySelector(
  '.band-single .band-single__nav, .single-casa .casa-section-nav'
  );

  let fixed = false;
  let scheduled = false;
  let naturalHeight = shell.getBoundingClientRect().height;

  function setPixelVariable(name, value) {
    const next = `${Math.max(0, Math.ceil(value))}px`;

    if (root.style.getPropertyValue(name) !== next) {
      root.style.setProperty(name, next);
    }
  }

  function getAdminOffset() {
    if (!adminBar) return 0;

    const rect = adminBar.getBoundingClientRect();

    // No mobile, a barra do WordPress pode sair da tela.
    return Math.max(0, Math.min(rect.height, rect.bottom));
  }

  function update() {
    scheduled = false;

    const adminOffset = getAdminOffset();

    setPixelVariable('--cs-admin-offset', adminOffset);

    const shouldFix =
      slot.getBoundingClientRect().top <= adminOffset;

    if (shouldFix && !fixed) {
      naturalHeight = shell.getBoundingClientRect().height;

      // Reserva a altura original antes de tirar o menu do fluxo.
      slot.style.height = `${naturalHeight}px`;

      shell.classList.add('is-fixed');
      fixed = true;
    } else if (!shouldFix && fixed) {
      shell.classList.remove('is-fixed');
      slot.style.removeProperty('height');
      fixed = false;
    }

    if (!fixed) {
      naturalHeight = shell.getBoundingClientRect().height;
    }

    setPixelVariable(
      '--cs-fixed-nav-height',
      fixed ? shell.getBoundingClientRect().height : 0
    );

    setPixelVariable(
      '--cs-band-nav-height',
      bandNav ? bandNav.getBoundingClientRect().height : 0
    );
  }

  function scheduleUpdate() {
    if (scheduled) return;

    scheduled = true;
    requestAnimationFrame(update);
  }

  function handleResize() {
    /*
     * Recalcula a altura normal após mudar a largura da tela.
     * As alterações acontecem no mesmo frame.
     */
    if (fixed) {
      shell.classList.remove('is-fixed');
      slot.style.removeProperty('height');

      naturalHeight = shell.getBoundingClientRect().height;
      slot.style.height = `${naturalHeight}px`;

      shell.classList.add('is-fixed');
    }

    scheduleUpdate();
  }

  window.addEventListener('scroll', scheduleUpdate, {
    passive: true,
  });

  window.addEventListener('resize', handleResize);

  window.addEventListener('load', handleResize, {
    once: true,
  });

  if ('ResizeObserver' in window) {
    const observer = new ResizeObserver(scheduleUpdate);

    observer.observe(shell);

    if (bandNav) {
      observer.observe(bandNav);
    }

    if (adminBar) {
      observer.observe(adminBar);
    }
  }

  /*
   * Considera o cabeçalho compacto já no clique da âncora,
   * mesmo quando o visitante ainda está no início da página.
   */
  document.addEventListener('click', (event) => {
    const link = event.target.closest(
      '.band-single a[href^="#"], .single-casa a[href^="#"]'
    );

    if (
      !link ||
      event.defaultPrevented ||
      event.ctrlKey ||
      event.metaKey ||
      event.shiftKey ||
      event.altKey
    ) {
      return;
    }

    const hash = link.getAttribute('href');

    if (!hash || hash === '#') return;

    const target = document.getElementById(hash.slice(1));

    if (!target) return;

    event.preventDefault();

    const adminOffset = getAdminOffset();

    /*
     * Mede a versão compacta sem alterar o espaço original.
     * O update seguinte decide se ela deve continuar fixa.
     */
    if (!fixed) {
      naturalHeight = shell.getBoundingClientRect().height;
      slot.style.height = `${naturalHeight}px`;
      shell.classList.add('is-fixed');
      fixed = true;
    }

    const mainHeight = shell.getBoundingClientRect().height;
    const internalHeight = bandNav
      ? bandNav.getBoundingClientRect().height
      : 0;

    setPixelVariable('--cs-fixed-nav-height', mainHeight);
    setPixelVariable('--cs-band-nav-height', internalHeight);

    const top =
      window.scrollY +
      target.getBoundingClientRect().top -
      adminOffset -
      mainHeight -
      internalHeight -
      20;

    window.scrollTo({
      top: Math.max(0, top),
      behavior: 'auto',
    });

    // Mantém a URL da âncora sem criar um segundo salto.
    if (window.location.hash !== hash) {
      window.history.pushState(null, '', hash);
    }

    // Transfere o foco para o conteúdo acessado.
    const hadTabindex = target.hasAttribute('tabindex');

    if (!hadTabindex) {
      target.setAttribute('tabindex', '-1');

      target.addEventListener('blur', () => {
        target.removeAttribute('tabindex');
      }, { once: true });
    }

    target.focus({ preventScroll: true });

    scheduleUpdate();
  });

  update();
}

if (document.readyState === 'loading') {
  document.addEventListener(
    'DOMContentLoaded',
    initStickyNavigation,
    { once: true }
  );
} else {
  initStickyNavigation();
}