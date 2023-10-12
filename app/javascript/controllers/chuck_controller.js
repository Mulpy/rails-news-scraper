require('dotenv').config()
import { Controller } from "@hotwired/stimulus"
import { application } from "./application";
// import dotenv from '../../../dotenv';
// dotenv.config();
console.log(process.env.CHUCK_API_KEY);

// Connects to data-controller="chuck"
export default class extends Controller {
  static targets = ["chuck", "button", "chuckfact"];

  connect() {
    // console.log("Hello from chuck_controller.js")
  }

  async generateChuck() {
    const url = 'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random';
    const options = {
      method: 'GET',
      headers: {
        accept: 'application/json',
        'X-RapidAPI-Key': `${process.env.CHUCK_API_KEY}`,
        'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com'
      }
    };
    try {
      const response = await fetch(url, options);
      const result = await response.text();
      const data = JSON.parse(result);
      const chuckFact = data['value'];
      this.chuckfactTarget.innerHTML = `<h3>${chuckFact}</h3>`;
    } catch (error) {
      console.error(error);
      this.chuckfactTarget.innerHTML = `<h3>Chuck Norris is too busy to tell you a joke right now.</h3>`;
    }
  }

  fire() {
    // console.log("fire");
    this.buttonTarget.innerHTML = `<button type="button" class="btn btn-warning" data-action="click->chuck#hide">Hide Chuck</button>`;
    setTimeout(() => {
      this.chuckTarget.innerHTML = `
      <div class="d-flex justify-content-center">
        <div class="align-self-center">
            <iframe src="https://giphy.com/embed/2dJ5Iait4QrW8" width="480" height="311" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
            <p><a href="https://giphy.com/gifs/chuck-ok-norris-2dJ5Iait4QrW8" target="_blank">(Thanks GIPHY)</a></p>
        </div>
      </div>
    `;
    }, 1000);
    this.generateChuck();
  }

  hide() {
    // console.log("hide");
    this.buttonTarget.innerHTML = `<button type="button" class="btn btn-primary" data-action="click->chuck#fire">Chuck!</button>`;
    this.chuckTarget.innerHTML = ``;
    this.chuckfactTarget.innerHTML = ``;
  }
}
