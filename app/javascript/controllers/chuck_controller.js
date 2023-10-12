import { Controller } from "@hotwired/stimulus"
import { application } from "./application";

// Connects to data-controller="chuck"
export default class extends Controller {
  static targets = ["chuck", "button"];

  connect() {
    // console.log("Hello from chuck_controller.js")
  }

  async generateChuck() {
    const url = 'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random';
    const options = {
      method: 'GET',
      headers: {
        accept: 'application/json',
        'X-RapidAPI-Key': '5fea725f4bmshe33f04d576c1ee8p196fe9jsn401a27bab034',
        'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com'
      }
    };
    try {
      const response = await fetch(url, options);
      const result = await response.text();
      console.log(result);
    } catch (error) {
      console.error(error);
    }
  }

  fire() {
    // console.log("fire");
    this.generateChuck();
    this.buttonTarget.innerHTML = `<button type="button" class="btn btn-warning" data-action="click->chuck#hide">Hide Chuck</button>`;
    this.chuckTarget.innerHTML = `
      <div class="d-flex justify-content-center">
        <div class="align-self-center">
          <h3>It's Chucky!</h3>
            <iframe src="https://giphy.com/embed/2dJ5Iait4QrW8" width="480" height="311" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
            <p><a href="https://giphy.com/gifs/chuck-ok-norris-2dJ5Iait4QrW8" target="_blank">(Thanks GIPHY)</a></p>
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
