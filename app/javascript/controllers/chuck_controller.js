import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="chuck"
export default class extends Controller {
  static targets = ["chuck", "button", "chuckfact"];

  connect() {
    // console.log("Hello from chuck_controller.js")
  }

  generateChuck() {
    // const url = 'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random';
    // const options = {
    //   method: 'GET',
    //   headers: {
    //     accept: 'application/json',
    //     'X-RapidAPI-Key': '>>>Insert Key here<<<',
    //     'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com'
    //   }
    // };
    // try {
    //   const response = await fetch(url, options);
    //   const result = await response.text();
    //   const data = JSON.parse(result);
    //   const chuckFact = data['value'];
    this.chuckfactTarget.innerHTML = `
        <div class="d-flex justify-content-center">
          <h3>It's Chuck!</h3>
        </div>`;
    // Add fade in effect
    this.chuckfactTarget.style.opacity = 0;
    setTimeout(() => {
      this.chuckfactTarget.style.transition = "opacity 1s";
      this.chuckfactTarget.style.opacity = 1;
    }, 500);
    // } catch (error) {
    //   console.error(error);
    //   this.chuckfactTarget.innerHTML = `<h3>Chuck Norris is too busy to tell you a joke right now.</h3>`;
  }

  fire() {
    // console.log("fire");
    this.buttonTarget.innerHTML = `<button type="button" id="hide-chuck" class="btn btn-warning" data-action="click->chuck#hide"><i class="fa-solid fa-user-ninja fa-2xl"></i></button>`;
    this.generateChuck();
    setTimeout(() => {
      this.chuckTarget.innerHTML = `
      <div class="d-flex justify-content-center">
        <div class="align-self-center">
            <iframe src="https://giphy.com/embed/2dJ5Iait4QrW8" width="480" height="311" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
        </div>
      </div>
    `;
      // Add slide left effect
      this.chuckTarget.style.transition = "transform 3s";
      this.chuckTarget.style.transform = "translateX(100%)";
      this.chuckTarget.style.display = "block";
      setTimeout(() => {
        this.chuckTarget.style.transform = "translateX(0)";
      }, 1000);
    }, 1000);
  }

  hide() {
    // console.log("hide");
    this.buttonTarget.innerHTML = `<button type="button" id="chuck" class="btn btn-primary" data-action="click->chuck#fire"><i class="fa-solid fa-hat-cowboy fa-2xl"></button>`;
    this.chuckTarget.innerHTML = ``;
    this.chuckfactTarget.innerHTML = ``;
  }
}
