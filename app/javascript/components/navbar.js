
const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.nav');
  const text = document.querySelectorAll('.nav-text');

    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= 0.3*window.innerHeight) {
          navbar.classList.add('navbar-lewagon-white');
            text.forEach(function(item){
            item.style.color = '#03CEA4';
          });

        } else {
          navbar.classList.remove('navbar-lewagon-white');
          text.forEach(function(item){
            item.style.color = 'white';
          });
        }
      });
    }

}

export { initUpdateNavbarOnScroll };


// const initUpdateNavbarOnScroll = () => {
//   const navbar = document.querySelector('.navbar-lewagon');
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('navbar-lewagon-white');
//       } else {
//         navbar.classList.remove('navbar-lewagon-white');
//       }
//     });
//   }
// }

// export { initUpdateNavbarOnScroll };
