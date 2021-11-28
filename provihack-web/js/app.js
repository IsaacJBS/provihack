const menuItems = document.querySelectorAll('.menu__navigation a[href^="#"]');

menuItems.forEach(item => {
  item.addEventListener('click', scrollToId)
});

function scrollToId(event) {
  event.preventDefault();
  const to = getScrollTop(event.target);

  scrollToPosition(to);
};

function scrollToPosition (to) {
  window.scroll({
    top: to,
    behavior: 'smooth'
  });
};

function getScrollTop(element) {
  const id = element.getAttribute('href');
  return document.querySelector(id).offsetTop;
}