import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableBbc", "togglablePolitico", "togglableAl_jazeera", "togglableNyt"];

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  bbc() {
    console.log("BBC firing");
    this.togglableBbcTarget.classList.toggle("d-none");
  }
}
