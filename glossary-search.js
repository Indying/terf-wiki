document.addEventListener("DOMContentLoaded", () => {
  const input = document.querySelector("[data-glossary-search]");
  const status = document.querySelector("[data-glossary-search-status]");
  const emptyState = document.querySelector("[data-glossary-empty]");
  const groups = Array.from(document.querySelectorAll(".glossary-group"));

  if (!input || groups.length === 0) {
    return;
  }

  const groupState = groups.map((group) => {
    const cards = Array.from(group.querySelectorAll(".group-link-card"));

    return {
      group,
      cards,
      initiallyOpen: group.hasAttribute("open"),
      groupText: [
        group.id,
        group.querySelector(".glossary-title")?.textContent ?? "",
        group.querySelector(".summary-count")?.textContent ?? "",
        group.querySelector(".section-copy")?.textContent ?? "",
      ]
        .join(" ")
        .toLowerCase(),
      cardText: cards.map((card) => ({
        card,
        text: card.textContent.toLowerCase(),
      })),
    };
  });

  function updateStatus(query, visibleGroups, visibleCards) {
    if (!status) {
      return;
    }

    if (!query) {
      status.textContent = "Showing all glossary groups.";
      return;
    }

    if (visibleCards === 0) {
      status.textContent = `No matches for "${query}".`;
      return;
    }

    const groupLabel = visibleGroups === 1 ? "group" : "groups";
    const cardLabel = visibleCards === 1 ? "subgroup page" : "subgroup pages";
    status.textContent = `Found ${visibleCards} ${cardLabel} across ${visibleGroups} ${groupLabel} for "${query}".`;
  }

  function applySearch() {
    const query = input.value.trim().toLowerCase();
    let visibleGroups = 0;
    let visibleCards = 0;

    groupState.forEach((entry) => {
      const { group, cards, initiallyOpen, groupText, cardText } = entry;

      if (!query) {
        group.hidden = false;
        cards.forEach((card) => {
          card.hidden = false;
        });

        if (initiallyOpen) {
          group.setAttribute("open", "");
        } else {
          group.removeAttribute("open");
        }

        visibleGroups += 1;
        visibleCards += cards.length;
        return;
      }

      const groupMatches = groupText.includes(query);
      let matchingCards = 0;

      cardText.forEach(({ card, text }) => {
        const matches = groupMatches || text.includes(query);
        card.hidden = !matches;

        if (matches) {
          matchingCards += 1;
        }
      });

      const showGroup = groupMatches || matchingCards > 0;
      group.hidden = !showGroup;

      if (showGroup) {
        group.setAttribute("open", "");
        visibleGroups += 1;
        visibleCards += groupMatches ? cards.length : matchingCards;
      } else {
        group.removeAttribute("open");
      }
    });

    if (emptyState) {
      emptyState.hidden = visibleCards !== 0;
    }

    updateStatus(input.value.trim(), visibleGroups, visibleCards);
  }

  input.addEventListener("input", applySearch);
  applySearch();
});
