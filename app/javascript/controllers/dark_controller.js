import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark"
export default class extends Controller {
  static targets = ['dark']

  connect() {
    console.log('hello from dark_controller.js');
  }

  toggle() {
    document.body.classList.toggle('dark');
    console.log(this.darkTarget);
    this.darkTarget.innerHTML = `<button data-action="click->dark#return">Toggle Light Mode</button>`;
  }

  return() {
    document.body.classList.toggle('dark');
    this.darkTarget.innerHTML = `<button data-action="click->dark#toggle">Toggle Dark Mode</button>`;
  }
}
