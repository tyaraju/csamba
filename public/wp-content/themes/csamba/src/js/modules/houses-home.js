export function initHousesHome() {
  const section = document.querySelector('.houses-showcase');
  if (!section) return;

  const houses = window.csambaHouses || [];

  if (!houses.length) return;

  const featuredImageLink = section.querySelector(
    '#houses-featured-image'
  );

  const featuredImage = section.querySelector(
    '#houses-featured-img'
  );

  const featuredTitle = section.querySelector(
    '#houses-featured-title'
  );

  const featuredDescription = section.querySelector(
    '#houses-featured-description'
  );

  const featuredLink = section.querySelector(
    '#houses-featured-link'
  );

  const thumbnails = [
    ...section.querySelectorAll('.houses-thumbnail')
  ];

  let currentHouseId = Number(houses[0].id);

  function showHouse(houseId) {
    const house = houses.find(
      item => Number(item.id) === Number(houseId)
    );

    if (!house) return;

    currentHouseId = Number(house.id);

    // Atualiza a casa principal.
    featuredImage.src = house.image;
    featuredImage.alt = house.title;
    featuredImageLink.href = house.url;
    featuredTitle.textContent = house.title;
    featuredDescription.textContent = house.description;
    featuredLink.href = house.url;

    // Atualiza o estado das miniaturas.
    thumbnails.forEach(button => {
      const isActive =
        Number(button.dataset.houseId) === currentHouseId;
      button.classList.toggle('is-active', isActive);
      button.setAttribute(
        'aria-pressed',
        String(isActive)
      );
    });
  }
  thumbnails.forEach(button => {
    button.addEventListener('click', () => {
      showHouse(button.dataset.houseId);
    });
  });
}