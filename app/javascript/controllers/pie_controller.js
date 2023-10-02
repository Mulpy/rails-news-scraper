import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

// import { color as colorLib } from 'chart.js/helpers';

export default class extends Controller {
  static targets = ['pie']

  connect() {
    console.log("Hello from pie controller.js");
  }

  fire(jsBbc, jsPolitico, jsAlJazeera, jsNyt, jsJapanTimes) {
    console.log("fire");
    const jsBbc = document.querySelector(".bbccount").value;
    console.log(jsBbc);
    console.log(jsPolitico);
    console.log(jsAlJazeera);
    console.log(jsNyt);
    console.log(jsJapanTimes);

    const newsArticles = {
      "BBC": 10,
      "Politico": 20,
      "Al Jazeera": 23,
      "NYT": 14,
      "Japan Times": 21
    };

    const labels = Object.keys(newsArticles);
    const data = Object.values(newsArticles);
    this.buildPie(labels, data);
  }

  buildPie(labels, data) {
    // console.log("build pie");
    this.pieTarget.innertext = new Chart(this.pieTarget, {
      type: 'pie',
      data: {
        labels: labels,
        datasets: [{
          label: 'News Ratio',
          data: data,
          backgroundColor: [
            'rgb(255, 160, 122)',
            'rgb(211, 211, 211)',
            'rgb(250, 250, 210)',
            'rgb(173, 216, 230)',
            'rgb(32, 178, 170)'
          ],
          hoverOffset: 4
        }]
      }
    });
  }
}
