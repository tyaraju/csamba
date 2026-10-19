function initBandsArchive() {
  const archive = document.querySelector('.bands-archive');

  if (!archive || archive.dataset.initialized === 'true') return;

  archive.dataset.initialized = 'true';

  // Catálogo
  const form = archive.querySelector('.bands-search');
  const input = archive.querySelector('#bands-search');
  const alphabet = archive.querySelector('.bands-alphabet');
  const letterButtons = [...archive.querySelectorAll('[data-letter]')];
  const cards = [...archive.querySelectorAll('[data-band-name]')];
  const count = archive.querySelector('[data-bands-count]');
  const empty = archive.querySelector('[data-bands-empty]');
  const reset = archive.querySelector('[data-bands-reset]');

  let selectedLetter = 'all';

  function normalize(value) {
    return value
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase()
      .trim();
  }

  function filterBands() {
    const query = normalize(input.value);
    let visible = 0;

    cards.forEach((card) => {
      const matchesName = normalize(card.dataset.bandName).includes(query);
      const matchesLetter =
        selectedLetter === 'all' ||
        card.dataset.bandLetter === selectedLetter;

      const matches = matchesName && matchesLetter;

      card.hidden = !matches;

      if (matches) visible++;
    });

    const filtered = query !== '' || selectedLetter !== 'all';

    count.textContent = filtered
      ? `${visible} ${visible === 1 ? 'artista encontrado' : 'artistas encontrados'}`
      : `${visible} ${visible === 1 ? 'artista cadastrado' : 'artistas cadastrados'}`;

    if (empty) empty.hidden = visible !== 0;
  }

  if (cards.length && form && input && alphabet && count) {
    alphabet.hidden = false;

    form.addEventListener('submit', (event) => {
      event.preventDefault();
      filterBands();
    });

    input.addEventListener('input', filterBands);

    letterButtons.forEach((button) => {
      button.addEventListener('click', () => {
        selectedLetter = button.dataset.letter;

        letterButtons.forEach((item) => {
          item.setAttribute(
            'aria-pressed',
            String(item === button)
          );
        });

        filterBands();
      });
    });

    reset?.addEventListener('click', () => {
      input.value = '';
      selectedLetter = 'all';

      letterButtons.forEach((button) => {
        button.setAttribute(
          'aria-pressed',
          String(button.dataset.letter === 'all')
        );
      });

      filterBands();
      input.focus();
    });
  }

  // Destaques: navegação manual, sem troca automática.
  const featured = archive.querySelector('.bands-featured');

  if (!featured) return;

  const slides = [...featured.querySelectorAll('.bands-featured__slide')];
  const controls = featured.querySelector('.bands-featured__controls');
  const previous = featured.querySelector('[data-featured-prev]');
  const next = featured.querySelector('[data-featured-next]');
  const dots = [...featured.querySelectorAll('[data-featured-index]')];
  const status = featured.querySelector('[data-featured-status]');

  if (slides.length < 2 || !controls) return;

  let current = 0;

  controls.hidden = false;

  function showSlide(index) {
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

  previous?.addEventListener('click', () => showSlide(current - 1));
  next?.addEventListener('click', () => showSlide(current + 1));

  dots.forEach((dot) => {
    dot.addEventListener('click', () => {
      showSlide(Number(dot.dataset.featuredIndex));
    });
  });
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initBandsArchive);
} else {
  initBandsArchive();
}