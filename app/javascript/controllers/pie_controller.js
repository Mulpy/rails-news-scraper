import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

// import { color as colorLib } from 'chart.js/helpers';

export default class extends Controller {
  static targets = ['pie']

  connect() {
    // console.log("Hello from pie controller.js");
  }

  fire() {
    // console.log("fire");
    const newsArticles = {
      "BBC": parseInt(jsBbc),
      "Politico": parseInt(jsPolitico),
      "Al Jazeera": parseInt(jsAlJazeera),
      "NYT": parseInt(jsNyt),
      "Japan Times": parseInt(jsJapanTimes)
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
          label: 'Articles',
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
