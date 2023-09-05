import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const mapElement = this.element;
    const apiKey = mapElement.dataset.mapApiKey;

    const script = document.createElement("script");
    script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places&callback=initMap`;
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);

    window.initMap = () => {
      const map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 19.2433, lng: -103.725 },
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

          if (types.includes("locality")) {
            document.getElementById("address_city").value = component.long_name;
          } else if (types.includes("administrative_area_level_1")) {
            document.getElementById("address_state").value = component.long_name;
          } else if (types.includes("postal_code")) {
            document.getElementById("address_zip_code").value = component.long_name;
          }
        }

        const streetNumber = place.address_components.find(component => component.types.includes("street_number"));
        const route = place.address_components.find(component => component.types.includes("route"));
        const neighborhood = place.address_components.find(component => component.types.includes("neighborhood"));
        const addressValue = `${route ? route.long_name : ''}${streetNumber ? ' ' + streetNumber.long_name : ''}${neighborhood ? ', ' + neighborhood.long_name : ''}`;
        document.getElementById("address-input").value = addressValue;
      }
    };
  }
}
