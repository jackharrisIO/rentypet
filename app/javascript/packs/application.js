import "bootstrap";
// import "places.js";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initAutocomplete } from '../components/init_autocomplete';

// import 'select2/dist/css/select2.css';

// import { initSelect2 } from '../components/initselect2';
// import { places } from '../packs/places';
initUpdateNavbarOnScroll();
initAutocomplete();

// initSelect2();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();


import "sweetalert2"
sweetalert2();
