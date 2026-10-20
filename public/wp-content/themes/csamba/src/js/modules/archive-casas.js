function initHousesArchive() {
  const page = document.querySelector('.houses-archive');

  if (!page || page.dataset.initialized === 'true') return;

  page.dataset.initialized = 'true';

  const normalize = (value) =>
    value
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase()
      .trim();

  // Busca e ordenação
  const grid = page.querySelector('.houses-grid');
  const cards = [...page.querySelectorAll('.house-card')];
  const search = page.querySelector('#house-search');
  const form = page.querySelector('.houses-search');
  const order = page.querySelector('#house-order');
  const sortControl = page.querySelector('.houses-sort');
  const count = page.querySelector('[data-house-count]');
  const empty = page.querySelector('[data-house-empty]');
  const reset = page.querySelector('[data-house-reset]');
  
  const alphabet = page.querySelector('.houses-alphabet');
  const letters = [...page.querySelectorAll('[data-house-letter]')];

  let selectedLetter = 'all';
  if (grid && search && form && order && count && empty) {
    sortControl.hidden = false;

    const collator = new Intl.Collator('pt-BR', {
      sensitivity: 'base',
      numeric: true,
    });

    function filter() {
      const query = normalize(search.value);
      let visible = 0;

      cards.forEach((card) => {
        const matchesSearch = normalize(card.dataset.houseSearch).includes(query);

        const matchesLetter =
          selectedLetter === 'all' ||
          card.dataset.houseInitial === selectedLetter;

        const matches = matchesSearch && matchesLetter;

        card.hidden = !matches;

        if (matches) visible++;
      });

      empty.hidden = visible !== 0;

      const filtered = query !== '' || selectedLetter !== 'all';

      count.textContent = filtered
        ? `${visible} ${visible === 1 ? 'casa encontrada' : 'casas encontradas'}`
        : `${visible} ${visible === 1 ? 'casa para conhecer' : 'casas para conhecer'}`;
    }

    function sort() {
      const direction = order.value === 'desc' ? -1 : 1;

      const sorted = [...cards].sort((a, b) =>
        direction * collator.compare(
          a.dataset.houseName,
          b.dataset.houseName
        )
      );

      const fragment = document.createDocumentFragment();

      sorted.forEach((card) => fragment.append(card));
      grid.append(fragment);
    }

    form.addEventListener('submit', (event) => {
      event.preventDefault();
      filter();
    });

    search.addEventListener('input', filter);
    order.addEventListener('change', sort);

    if (alphabet) {
      alphabet.hidden = false;

      letters.forEach((button) => {
        button.addEventListener('click', () => {
          selectedLetter = button.dataset.houseLetter;

          letters.forEach((item) => {
            item.setAttribute('aria-pressed', String(item === button));
          });

          filter();
        });
      });
    }

    reset?.addEventListener('click', () => {
      search.value = '';
      selectedLetter = 'all';

      letters.forEach((button) => {
        button.setAttribute(
          'aria-pressed',
          String(button.dataset.houseLetter === 'all')
        );
      });

      filter();
      search.focus();
    });

    sort();
  }

  // Carrossel manual
  const featured = page.querySelector('.houses-featured');

  if (!featured) return;

  const slides = [...featured.querySelectorAll('.houses-featured__slide')];
  const controls = featured.querySelector('.houses-featured__controls');
  const dots = [...featured.querySelectorAll('[data-house-slide]')];
  const status = featured.querySelector('[data-house-status]');

  if (slides.length < 2 || !controls) return;

  let current = 0;

  controls.hidden = false;

  function show(index) {
    current = (index + slides.length) % slides.length;

    slides.forEach((slide, slideIndex) => {
      slide.hidden = slideIndex !== current;
    });

    dots.forEach((dot, dotIndex) => {
      if (dotIndex === current) {
        dot.setAttribute('aria-current', 'true');
      } else {
        dot.removeAttribute('aria-current');
      }
    });

    if (status) {
      status.textContent = slides[current].getAttribute('aria-label');
    }
  }

  featured.querySelector('[data-house-prev]')
    ?.addEventListener('click', () => show(current - 1));

  featured.querySelector('[data-house-next]')
    ?.addEventListener('click', () => show(current + 1));

  dots.forEach((dot) => {
    dot.addEventListener('click', () => {
      show(Number(dot.dataset.houseSlide));
    });
  });
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initHousesArchive);
} else {
  initHousesArchive();
}