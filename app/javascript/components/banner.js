import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Have a different pet every weekend", "Make a new friend once a week", "Spoon a different furbaby every night"],
    typeSpeed: 30,
    loop: true
  });
}

export { loadDynamicBannerText };
