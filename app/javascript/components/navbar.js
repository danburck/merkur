const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const text = document.querySelectorAll('.nav-link');
  const logo = document.querySelector('.logo-white')
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 400) {
        navbar.classList.add('navbar-lewagon-white');
        logo.classList.remove('logo-white');
        text.forEach(element => element.classList.add('nav-link-white'));
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        logo.classList.add('logo-white');
        text.forEach(element => element.classList.remove('nav-link-white'));
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
