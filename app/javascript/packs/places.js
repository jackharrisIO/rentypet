// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('flat_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// initAutocomplete();



var places = require('places.js');
var placesAutocomplete = places({
  appId: <N0PAT9ECX3>,
  apiKey: <ecf22ff420e5c6f1a3cdaeba57cb6bfc>,
  container: document.querySelector('#address-input')
});
