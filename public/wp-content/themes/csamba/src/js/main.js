import Swiper from 'swiper';
import { Autoplay, Keyboard, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/pagination';
import '../css/app.css';
import { initAgendaHome } from './modules/agenda-home.js';
// outros imports que você já tiver...

document.addEventListener('DOMContentLoaded', () => {
    console.log('main.js carregou');

    initAgendaHome();
});
Swiper.use([Autoplay, Keyboard, Pagination]);

const menuButton = document.querySelector('.menu-toggle');
const menu = document.querySelector('.main-nav');
if (menuButton && menu) {
  menuButton.addEventListener('click', () => {
    const open = menu.classList.toggle('is-open');
    menuButton.setAttribute('aria-expanded', String(open));
  });
}

const slider = document.querySelector('.csamba-featured-swiper');
if (slider) {
  const slides = [...slider.querySelectorAll('.swiper-slide')];
  const pagination = document.querySelector('.featured-pagination');
  const swiper = new Swiper(slider, {
    loop: slides.length > 1,
    speed: 550,
    autoplay: slides.length > 1 ? { delay: 106500, disableOnInteraction: false } : false,
    keyboard: { enabled: true },
    pagination: {
      el: pagination,
      clickable: true,
      renderBullet(index, className) {
        const slide = slides[index];
        const label = slide?.dataset.label || `Destaque ${index + 1}`;
        const color = slide?.dataset.color || '#2878d7';
        return `<button class="${className} featured-bullet" type="button" style="--bullet-color:${color}" aria-label="Abrir ${label}">${label}</button>`;
      }
    }
  });
  slider.addEventListener('mouseenter', () => swiper.autoplay?.stop());
  slider.addEventListener('mouseleave', () => swiper.autoplay?.start());
}

const houseInput = document.querySelector('#house-search-input');
const houseUrl = document.querySelector('#house-search-url');
const houseResults = document.querySelector('#house-search-results');
const houseButton = document.querySelector('#house-search-button');

if (
  houseInput &&
  houseUrl &&
  houseResults &&
  houseButton &&
  Array.isArray(window.csambaHouses)
) {

  const normalizeText = (text) => {
    return text
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase();
  };


  const closeResults = () => {
    houseResults.innerHTML = '';
    houseResults.classList.remove('is-open');
  };


  const selectHouse = (house) => {
    houseInput.value = house.title;
    houseUrl.value = house.url;

    houseButton.disabled = false;

    closeResults();
  };


  houseInput.addEventListener('input', () => {
    const search = normalizeText(houseInput.value.trim());
    houseUrl.value = '';
    houseButton.disabled = true;
    houseResults.innerHTML = '';
    if (search.length < 1) {
      closeResults();
      return;
    }
    const matches = window.csambaHouses
      .filter((house) =>
        normalizeText(house.title).includes(search)
      )
      .slice(0, 6);
    if (!matches.length) {
      houseResults.innerHTML = `
        <div class="house-search-empty">
          Nenhuma casa encontrada
        </div>
      `;
      houseResults.classList.add('is-open');
      return;
    }
    matches.forEach((house) => {
      const item = document.createElement('button');
      item.type = 'button';
      item.className = 'house-search-result';
      item.setAttribute('role', 'option');
      item.textContent = house.title;
      item.addEventListener('click', () => {
        selectHouse(house);
      });
      houseResults.appendChild(item);
    });
    houseResults.classList.add('is-open');
  });

  houseButton.addEventListener('click', () => {
    if (houseUrl.value) {
      window.location.href = houseUrl.value;
    }
  });

  document.addEventListener('click', (event) => {
    if (!event.target.closest('.house-search-field')) {
      closeResults();
    }
  });
}
