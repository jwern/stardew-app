document.addEventListener("turbolinks:load", () => {
  document.querySelectorAll("[data-js-hide-link]").forEach(el => {
    el.addEventListener('click', event => {
      alert("You clicked the hide link!");
      el.parentNode.style.display = "none"
      event.preventDefault();
    });
  });
});
