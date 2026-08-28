import Swiper from 'swiper';
import { Autoplay, Keyboard, Pagination } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/pagination';
import '../css/app.css';

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
    autoplay: slides.length > 1 ? { delay: 6500, disableOnInteraction: false } : false,
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
