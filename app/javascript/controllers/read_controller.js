import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read"
export default class extends Controller {
  static targets = ["checkbox", "mulpy", "bookmark"];

  connect() {
    console.log("Hello from read_controller.js")
  }

  read() {
    this.mulpyTarget.classList.toggle("read");
  }

  delete() {
    this.mulpyTarget.classList.add("d-none");
  }

  bookmark() {
    this.bookmarkTarget.classList.innerHTML = `<i class="fa-solid fa-bookmark"></i>`;
  }
}
