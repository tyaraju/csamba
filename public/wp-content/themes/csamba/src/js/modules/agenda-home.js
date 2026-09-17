export function initAgendaHome() {
  console.log('agenda-home.js iniciou');

  const agenda = document.querySelector('.agenda-home');
  console.log('agenda encontrada:', agenda);

  if (!agenda) {
        console.warn('.agenda-home não encontrada');
    return;
  }

  const tabs = agenda.querySelectorAll('.agenda-tab');
  const list = agenda.querySelector('#agenda-events-list');

  if (!tabs.length || !list) {
    return;
  }
  
    /*
     * MAPA
     */
    const map = L.map('agenda-map', {
      scrollWheelZoom: false
    }).setView([
      -30.0346,
      -51.2177
    ], 12);


    L.tileLayer(
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap'
      }
    ).addTo(map);

    /*
     * Grupo dos pins.
     *
     * Assim conseguimos apagar todos
     * ao trocar de dia.
     */

    const markers = L.layerGroup().addTo(map);

    async function loadEvents(date) {

      list.innerHTML = `
            <p class="agenda-loading">
                Carregando agenda...
            </p>
        `;
      try {
        const url = new URL(csambaAgenda.ajaxUrl);
        url.searchParams.set(
          'action',
          'csamba_get_events'
        );
        url.searchParams.set(
          'date',
          date
        );
        const response = await fetch(url);
        const data = await response.json();

        if (!data.success) {
          throw new Error('Erro ao carregar eventos');
        }

        renderEvents(data.data.events);
        renderMap(data.data.events);

      } catch (error) {
        console.error(error);
        list.innerHTML = `
                <p class="agenda-empty">
                    Não foi possível carregar a agenda.
                </p>
            `;
      }
    }

    /*
     * LISTA
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
        item.href = event.url;
        item.className = 'agenda-event';

        item.innerHTML = `
                <time>
                    ${escapeHTML(event.time || '')}
                </time>
                <strong>
                    ${escapeHTML(event.title)}
                </strong>
                <span class="agenda-event-venue">
                    ${escapeHTML(event.venue || '')}
                </span>
                <span class="agenda-event-neighborhood">
                    ${escapeHTML(event.neighborhood || '')}
                </span>
            `;

        list.appendChild(item);
      });
    }

    /*
     * MAPA
     */
    function renderMap(events) {
      markers.clearLayers();
      const bounds = [];

      events.forEach(event => {
        if (!event.lat || !event.lng) {
          return;
        }

        const marker = L.marker([
          event.lat,
          event.lng
        ]);

        /*
         * CAIXINHA DO PIN
         */

        marker.bindPopup(`
                <div class="agenda-map-popup">
                    <strong>
                        ${escapeHTML(event.title)}
                    </strong>
                    <span>
                        ${escapeHTML(event.time || '')}
                        ·
                        ${escapeHTML(event.venue || '')}
                    </span>
                    ${
                        event.neighborhood
                            ? `
                                <small>
                                    ${escapeHTML(event.neighborhood)}
                                </small>
                            `
                            : ''
                    }
                    <a href="${event.url}">
                        VER EVENTO →
                    </a>
                </div>
            `);

        marker.addTo(markers);

        bounds.push([
          event.lat,
          event.lng
        ]);
      });

      /*
       * Ajusta mapa automaticamente
       * para mostrar todos os eventos.
       */
      if (bounds.length) {

        map.fitBounds(bounds, {
          padding: [30, 30],
          maxZoom: 14
        });
      }
    }

   /*
     * ABAS
     */
    tabs.forEach(tab => {
      tab.addEventListener('click', () => {
        tabs.forEach(item =>
          item.classList.remove('is-active')
        );
        tab.classList.add('is-active');
        loadEvents(
          tab.dataset.date
        );
      });
    });

    /*
     * Segurança básica porque estamos
     * inserindo conteúdo no innerHTML.
     */
    function escapeHTML(value) {
      const div = document.createElement('div');
      div.textContent = value;
      return div.innerHTML;
    }

   /*
     * Carrega HOJE
     */

    loadEvents(
      tabs[0].dataset.date
    );
}