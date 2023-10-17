import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["read", "togglableBbc", "togglablePolitico", "togglableAl_jazeera", "togglableNyt", "togglableJapan_times", "togglableAp"];

  connect() {
    // console.log("Hello from toggle_controller.js")
  }

  bbc() {
    const divs = document.querySelectorAll('.bbc');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }

  politico() {
    const divs = document.querySelectorAll('.politico');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }

  al_jazeera() {
    const divs = document.querySelectorAll('.al_jazeera');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }

  nyt() {
    const divs = document.querySelectorAll('.nyt');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }

  japan_times() {
    const divs = document.querySelectorAll('.japan_times');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }

  ap() {
    const divs = document.querySelectorAll('.ap');
    divs.forEach((div) => {
      div.classList.toggle("d-none");
    });
  }

  read() {
    console.log(this.readTarget);
    this.readTarget.classList.add("read");
  }
}
