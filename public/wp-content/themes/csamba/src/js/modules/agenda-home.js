import Swiper from 'swiper';
import { Navigation, Pagination } from 'swiper/modules';

export function initAgendaHome() {
  const agenda = document.querySelector('.agenda-home');
  if (!agenda) return;

  const tabs = [...agenda.querySelectorAll('.agenda-tab')];
  const list = agenda.querySelector('#agenda-events-list');
  const bandsList = agenda.querySelector('#agenda-bands-list');
  const bandsEmpty = agenda.querySelector('#agenda-bands-empty');
  const seeAll = agenda.querySelector('#agenda-see-all');
  const openMap = agenda.querySelector('#agenda-open-map');
  const mapElement = agenda.querySelector('#agenda-map');

  if (!tabs.length || !list || !bandsList) return;

  /*
   * SWIPER DOS DIAS
   */

  const daysSwiper = new Swiper(
    agenda.querySelector('.agenda-days-swiper'), {
      modules: [Navigation],
      slidesPerView: 3,
      spaceBetween: 8,
      navigation: {
        prevEl: agenda.querySelector('.agenda-days-prev'),
        nextEl: agenda.querySelector('.agenda-days-next'),
      },
      breakpoints: {
        480: {
          slidesPerView: 4,
        },

        768: {
          slidesPerView: 5,
        },

        1200: {
          slidesPerView: 7,
        },
      },
    }
  );


  /*
   * SWIPER DAS BANDAS
   */

  const bandsSwiper = new Swiper(
    agenda.querySelector('.agenda-bands-swiper'), {
      modules: [Navigation, Pagination],
      slidesPerView: 1,
      slidesPerGroup: 1,
      spaceBetween: 0,
      speed: 450,
      watchOverflow: true,
      navigation: {
        prevEl: agenda.querySelector('.agenda-bands-prev'),
        nextEl: agenda.querySelector('.agenda-bands-next'),
      },
      pagination: {
        el: agenda.querySelector('.agenda-bands-pagination'),
        clickable: true,
      },
    }
  );


  /*
   * MAPA LEAFLET
   */

  let map = null;
  let markers = null;

  if (mapElement && window.L) {

    map = window.L.map(mapElement, {
      scrollWheelZoom: false,
    }).setView(
      [-30.0346, -51.2177],
      12
    );

    window.L.tileLayer(
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap',
      }
    ).addTo(map);

    markers = window.L.layerGroup().addTo(map);
  }


  /*
   * HELPERS
   */

  function escapeHTML(value) {

    const div = document.createElement('div');

    div.textContent = String(value ?? '');

    return div.innerHTML;
  }

  function formatTime(value) {

    if (!value) return '';

    const [hours, minutes] = value.split(':');

    return minutes === '00' ?
      `${hours}h` :
      `${hours}h${minutes}`;
  }


  /*
   * LISTA DE EVENTOS
   */

  function renderEvents(events) {

    list.innerHTML = '';

    if (!events.length) {

      list.innerHTML = `
                <p class="agenda-empty">
                    Nenhum evento cadastrado para este dia.
                </p>
            `;

      return;
    }

    events.forEach(event => {

      const item = document.createElement('a');

      item.className = 'agenda-event';

      item.href = event.url;

      const venue = event.venue ?
        `
                    <span>
                        ${escapeHTML(event.venue)}
                    </span>
                ` :
        '';

      const neighborhood = event.neighborhood ?
        `
                    <span>
                        ${escapeHTML(event.neighborhood)}
                    </span>
                ` :
        '';

      item.innerHTML = `
                <time class="agenda-event-time">
                    ${escapeHTML(formatTime(event.time))}
                </time>

                <div class="agenda-event-info">

                    <strong class="agenda-event-title">
                        ${escapeHTML(event.title)}
                    </strong>

                    <div class="agenda-event-meta">
                        ${venue}
                        ${neighborhood}
                    </div>

                </div>

                <span class="agenda-event-arrow">
                    ›
                </span>
            `;

      list.appendChild(item);
    });
  }


  /*
   * BANDAS DO DIA
   */

  function renderBands(events) {
    const bands = new Map();
    events.forEach(event => {
      if (!event.band || !event.band.id) return;
      const id = event.band.id;

      /*
       * Se a mesma banda tiver dois eventos,
       * exibimos apenas um card.
       */
      if (!bands.has(id)) {
        bands.set(id, {
          ...event.band,
          time: event.time,
          venue: event.venue,
        });
      }
    });

    const uniqueBands = [...bands.values()];
    bandsList.innerHTML = '';
    bandsEmpty.hidden = uniqueBands.length > 0;
    uniqueBands.forEach(band => {
      const slide = document.createElement('div');
      slide.className = 'swiper-slide';
      const image = band.image ?
        `
                    <img
                        src="${escapeHTML(band.image)}"
                        alt=""
                        loading="lazy"
                    >
                ` :
        `
                    <div class="agenda-band-placeholder">
                        CSAMBA
                    </div>
                `;

      slide.innerHTML = `
                <article class="agenda-band-card">
                    <a
                        href="${escapeHTML(band.url)}"
                        class="agenda-band-image"
                    >
                        ${image}
                    </a>
                    <div class="agenda-band-copy">
                        <h4>
                            ${escapeHTML(band.title)}
                        </h4>
                        <p>
                            Hoje · ${escapeHTML(formatTime(band.time))}
                        </p>
                        <p>
                            ${escapeHTML(band.venue)}
                        </p>
                        <a href="${escapeHTML(band.url)}">
                            VER BANDA →
                       </a>
                    </div>
                </article>
            `;

      bandsList.appendChild(slide);
    });
    bandsSwiper.update();
    bandsSwiper.slideTo(0, 0);
    if (bandsSwiper.pagination) {
      bandsSwiper.pagination.render();
      bandsSwiper.pagination.update();
   }
  }


  /*
   * MAPA
   */

  function renderMap(events) {

    if (!map || !markers) return;

    markers.clearLayers();

    const bounds = [];

    /*
     * Agrupa eventos por casa.
     * Uma casa com dois shows recebe um pin.
     */

    const venues = new Map();

    events.forEach(event => {

      const lat = Number(event.lat);
      const lng = Number(event.lng);

      if (
        !Number.isFinite(lat) ||
        !Number.isFinite(lng) ||
        !lat ||
        !lng
      ) {
        return;
      }

      const key = event.venue_id ?
        `venue-${event.venue_id}` :
        `${lat},${lng}`;

      if (!venues.has(key)) {

        venues.set(key, {
          lat,
          lng,
          name: event.venue,
          events: [],
        });
      }

      venues.get(key).events.push(event);
    });


    venues.forEach(venue => {

      const popupEvents = venue.events.map(event => `
                <div class="agenda-popup-event">

                    <strong>
                        ${escapeHTML(event.title)}
                    </strong>

                    <span>
                        ${escapeHTML(formatTime(event.time))}
                    </span>

                    <a href="${escapeHTML(event.url)}">
                        VER EVENTO →
                    </a>

                </div>
            `).join('');


      const marker = window.L.marker([
        venue.lat,
        venue.lng,
      ]);

      marker.bindPopup(`
                <div class="agenda-map-popup">

                    <h4>
                        ${escapeHTML(venue.name)}
                    </h4>

                    ${popupEvents}

                </div>
            `);

      marker.addTo(markers);

      bounds.push([
        venue.lat,
        venue.lng,
      ]);
    });


    if (bounds.length === 1) {

      map.setView(bounds[0], 14);

    } else if (bounds.length > 1) {

      map.fitBounds(bounds, {
        padding: [30, 30],
        maxZoom: 14,
      });

    } else {

      map.setView(
        [-30.0346, -51.2177],
        12
      );
    }

    map.invalidateSize();
  }


  /*
   * LINKS DO DIA
   */

  function updateLinks(date) {

    const url = new URL(
      '/agenda/',
      window.location.origin
    );

    url.searchParams.set('data', date);

    if (seeAll) {
      seeAll.href = url.toString();
    }

    if (openMap) {
      openMap.href = url.toString() + '#mapa';
    }
  }


  /*
   * CARREGAMENTO AJAX
   */

  let requestController = null;

  async function loadEvents(date) {

    if (requestController) {
      requestController.abort();
    }

    requestController = new AbortController();

    list.innerHTML = `
            <p class="agenda-loading">
                Carregando agenda...
            </p>
        `;

    bandsList.innerHTML = '';

    bandsEmpty.hidden = true;

    if (markers) {
      markers.clearLayers();
    }

    updateLinks(date);

    try {

      const url = new URL(
        window.csambaAgenda.ajaxUrl
      );

      url.searchParams.set(
        'action',
        'csamba_get_events'
      );

      url.searchParams.set('date', date);

      const response = await fetch(url, {
        signal: requestController.signal,
      });

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }

      const data = await response.json();

      if (!data.success) {
        throw new Error('Erro ao carregar eventos');
      }

      const events = data.data.events || [];

      renderEvents(events);

      renderBands(events);

      renderMap(events);

    } catch (error) {

      if (error.name === 'AbortError') return;

      console.error(error);

      list.innerHTML = `
                <p class="agenda-empty">
                    Não foi possível carregar a agenda.
                </p>
            `;
    }
  }


  /*
   * TROCA DE DIA
   */

  tabs.forEach(tab => {

    tab.addEventListener('click', () => {

      tabs.forEach(item => {

        item.classList.remove('is-active');

        item.setAttribute(
          'aria-pressed',
          'false'
        );
      });

      tab.classList.add('is-active');

      tab.setAttribute(
        'aria-pressed',
        'true'
      );

      loadEvents(tab.dataset.date);
    });
  });


  /*
   * INICIALIZAÇÃO
   */

  loadEvents(tabs[0].dataset.date);
}