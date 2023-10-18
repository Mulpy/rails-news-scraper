import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read"
export default class extends Controller {
  static targets = ["checkbox", "mulpy"];

  connect() {
    console.log("Hello from read_controller.js")
  }

  read() {
    this.mulpyTarget.classList.toggle("read");
  }

  delete() {
    this.mulpyTarget.classList.add("d-none");
  }
}
