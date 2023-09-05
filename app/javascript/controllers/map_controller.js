import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  connect() {
    const mapElement = this.element; // The HTML element to contain the map
    const apiKey = mapElement.dataset.mapApiKey; // Replace with your Google Maps API key

    // Load the Google Maps API asynchronously
    const script = document.createElement("script");
    script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&callback=initMap`;
    document.head.appendChild(script);

    // Define the initMap function in the global scope
    window.initMap = () => {
      const map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 19.2433, lng: -103.725 }, // Centra el mapa en la ciudad de Colima
        zoom: 14,
      });
  
      const input = document.getElementById("address-input");
      const autocomplete = new google.maps.places.Autocomplete(input);
  
      map.addListener("click", function (event) {
        const geocoder = new google.maps.Geocoder();
        geocoder.geocode({ location: event.latLng }, function (results, status) {
          if (status === "OK" && results[0]) {
            input.value = results[0].formatted_address;
            fillAddressFields(results[0]);
          }
        });
      });
  
      autocomplete.addListener("place_changed", function () {
        const place = autocomplete.getPlace();
        if (place.geometry) {
          map.setCenter(place.geometry.location);
          fillAddressFields(place);
        }
      });
  
      function fillAddressFields(place) {
        const addressComponents = place.address_components;
  
        for (const component of addressComponents) {
          const types = component.types;
  
          if (types.includes("locality")) { // Ciudad
            document.getElementById("address_city").value = component.long_name;
          } else if (types.includes("administrative_area_level_1")) { // Estado
            document.getElementById("address_state").value = component.long_name;
          } else if (types.includes("postal_code")) { // Código Postal
            document.getElementById("address_zip_code").value = component.long_name;
          }
        }
  
        // Extraer la parte de la dirección correspondiente a la calle, número y colonia
        const streetNumber = place.address_components.find(component => component.types.includes("street_number"));
        const route = place.address_components.find(component => component.types.includes("route"));
        const neighborhood = place.address_components.find(component => component.types.includes("neighborhood"));
        const addressValue = `${route ? route.long_name : ''}${streetNumber ? ' ' + streetNumber.long_name : ''}${neighborhood ? ', ' + neighborhood.long_name : ''}`;
        document.getElementById("address-input").value = addressValue;
      }
    };
  }

}
