const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const text = document.querySelectorAll('.nav-link');
  const logo = document.querySelector('.logo-white')
  const hamburger = document.querySelector(".navbar")
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 400) {
        navbar.classList.add('navbar-lewagon-white');
        logo.classList.remove('logo-white');
        hamburger.classList.add("navbar-light");
        text.forEach(element => element.classList.add('nav-link-white'));
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        logo.classList.add('logo-white');
        hamburger.classList.remove("navbar-dark");
        text.forEach(element => element.classList.remove('nav-link-white'));
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
