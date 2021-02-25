const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const text = document.querySelectorAll('.nav-link');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 400) {
        navbar.classList.add('navbar-lewagon-white');
        text.forEach(element => element.classList.add('nav-link-white'));
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        text.forEach(element => element.classList.remove('nav-link-white'));
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
