(function () {
  "use strict";

  // Menu mobile
  var toggle = document.querySelector(".nav-toggle");
  var menu = document.querySelector(".site-nav .menu");
  if (toggle && menu) {
    toggle.addEventListener("click", function () {
      var open = menu.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
    });
  }

  // Abas da PDP da banda
  document.querySelectorAll("[data-tabs]").forEach(function (root) {
    var buttons = root.querySelectorAll(".band-tabs button");
    buttons.forEach(function (btn) {
      btn.addEventListener("click", function () {
        buttons.forEach(function (b) {
          b.setAttribute("aria-selected", "false");
          var panel = document.getElementById(b.getAttribute("aria-controls"));
          if (panel) panel.hidden = true;
        });
        btn.setAttribute("aria-selected", "true");
        var target = document.getElementById(btn.getAttribute("aria-controls"));
        if (target) target.hidden = false;
      });
    });
  });

  // Filtro do A-Z de bandas
  var azInput = document.querySelector("[data-az-filter]");
  if (azInput) {
    azInput.addEventListener("input", function () {
      var term = azInput.value.trim().toLowerCase();
      document.querySelectorAll(".az-group").forEach(function (group) {
        var visible = 0;
        group.querySelectorAll("li").forEach(function (item) {
          var match = item.textContent.toLowerCase().indexOf(term) !== -1;
          item.hidden = !match;
          if (match) visible++;
        });
        group.hidden = visible === 0;
      });
    });
  }
})();
