import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Have a different<br /> pet every weekend", "Make a new <br />friend once a week", "Spoon a different <br />furbaby every night"],
    typeSpeed: 30,
    loop: true
  });
}

export { loadDynamicBannerText };
