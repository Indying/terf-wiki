const root = document.documentElement;
const toggle = document.querySelector("[data-theme-toggle]");
const label = document.querySelector("[data-theme-label]");
const storedTheme = localStorage.getItem("theme");
const systemPrefersDark = window.matchMedia("(prefers-color-scheme: dark)");

function getPreferredTheme() {
  if (storedTheme === "light" || storedTheme === "dark") {
    return storedTheme;
  }

  return systemPrefersDark.matches ? "dark" : "light";
}

function syncToggleText(theme) {
  if (!label) {
    return;
  }

  label.textContent = theme === "dark" ? "Light mode" : "Dark mode";
}

function applyTheme(theme) {
  root.setAttribute("data-theme", theme);
  syncToggleText(theme);
}

applyTheme(getPreferredTheme());

if (toggle) {
  toggle.addEventListener("click", () => {
    const nextTheme =
      root.getAttribute("data-theme") === "dark" ? "light" : "dark";

    localStorage.setItem("theme", nextTheme);
    applyTheme(nextTheme);
  });
}

systemPrefersDark.addEventListener("change", (event) => {
  if (localStorage.getItem("theme")) {
    return;
  }

  applyTheme(event.matches ? "dark" : "light");
});
