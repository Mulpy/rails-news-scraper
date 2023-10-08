import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark"
export default class extends Controller {
  connect() {
    console.log('hello from dark_controller.js');
  }

  toggle() {
    document.body.classList.toggle('dark');
    this.darkTarget.innerHTML =
      ```<button data-controller="dark"
    data-action="click->dark#return"
    data-dark-target='dark'>Toggle Light Mode</button>```;
  }

  return() {
    document.body.classList.toggle('dark');
    this.darkTarget.innerHTML =
      ```<button data-controller="dark"
    data-action="click->dark#toggle"
    data-dark-target='dark'>Toggle Dark Mode</button>```;
  }
}
