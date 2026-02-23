// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function () {
  const avatarBtn = document.getElementById("avatarBtn");
  const dropdownMenu = document.getElementById("dropdownMenu");

  if (!avatarBtn || !dropdownMenu) return;

  avatarBtn.addEventListener("click", function (e) {
    e.preventDefault();
    e.stopPropagation(); // 追加：外側クリック判定を止める
    dropdownMenu.classList.toggle("show");
  });

  document.addEventListener("click", function (e) {
    if (!avatarBtn.contains(e.target) && !dropdownMenu.contains(e.target)) {
      dropdownMenu.classList.remove("show");
    }
  });
});
