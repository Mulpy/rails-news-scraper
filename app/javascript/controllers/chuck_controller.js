import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chuck"
export default class extends Controller {
  static targets = ["chuck", "button"];

  connect() {
    console.log("Hello from chuck_controller.js")
  }

  fire() {
    console.log("fire");
    this.buttonTarget.innerHTML = `<button type="button" class="btn btn-warning" data-action="click->chuck#hide">Hide Chuck</button>`;
    this.chuckTarget.innerHTML = `
    <div class="shadow p-3 mb-5 bg-white rounded mt-4" id="stats">
      <div class="d-flex justify-content-center">
        <div class="align-self-center">
          <h3>It's Chucky!</h3>
            <iframe src="https://giphy.com/embed/2dJ5Iait4QrW8" width="480" height="311" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
            <p><a href="https://giphy.com/gifs/chuck-ok-norris-2dJ5Iait4QrW8" target="_blank">(Thanks GIPHY)</a></p>
        </div>
      </div>
    </div>
    `;
  }

  hide() {
    console.log("hide");
    this.buttonTarget.innerHTML = `<button type="button" class="btn btn-primary" data-action="click->chuck#fire">Chuck!</button>`;
    this.chuckTarget.innerHTML = ``;
  }
}
