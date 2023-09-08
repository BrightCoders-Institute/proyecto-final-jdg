import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="productna"
export default class extends Controller {
  connect() {
      const productTypeField = document.querySelector("#product_product_type"); // Cambia "#product_product_type" al selector correcto si es necesario
      const sizeField = document.querySelector("#size_field");
  
      // Función para actualizar el campo de tamaño
      function updateSizeField() {
        if (productTypeField.value === "Pins" || productTypeField.value === "Cases") {
          sizeField.value = "N/A";
          sizeField.disabled = true;
        } else {
          sizeField.value = ""; // Restablecer el valor si no es Pins/Cases
          sizeField.disabled = false;
        }
      }
  
      // Llama a la función al cargar la página y cuando cambia el campo product_type
      updateSizeField();
      productTypeField.addEventListener("change", updateSizeField);
  }
}
