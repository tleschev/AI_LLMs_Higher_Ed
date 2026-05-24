document.addEventListener("DOMContentLoaded", function () {
  const tocLinks = document.querySelectorAll(".sidebar .nav-link");
  if (!tocLinks.length) return;

  // Construire la map ancre → lien
  const linkMap = {};
  tocLinks.forEach(link => {
    const href = link.getAttribute("href");
    if (href && href.startsWith("#")) {
      linkMap[href.slice(1)] = link;
    }
  });

  const headings = Array.from(
    document.querySelectorAll("#component-content h1, #component-content h2, #component-content h3, #component-content h4")
  ).filter(h => h.id && linkMap[h.id]);

  function setActive(id) {
    tocLinks.forEach(l => l.classList.remove("toc-active"));
    if (id && linkMap[id]) {
      linkMap[id].classList.add("toc-active");
    }
  }

  const observer = new IntersectionObserver(
    entries => {
      // Trouver le premier heading visible
      const visible = headings.filter(h => {
        const rect = h.getBoundingClientRect();
        return rect.top >= 0 && rect.top < window.innerHeight * 0.4;
      });
      if (visible.length) {
        setActive(visible[0].id);
      }
    },
    { rootMargin: "0px 0px -60% 0px", threshold: 0 }
  );

  headings.forEach(h => observer.observe(h));
});
