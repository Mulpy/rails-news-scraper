import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableBbc", "togglablePolitico", "togglableAl_jazeera", "togglableNyt"];

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  bbc() {
    const divs = document.querySelectorAll('.bbc');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }
}
