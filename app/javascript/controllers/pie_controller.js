import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

// import { color as colorLib } from 'chart.js/helpers';

export default class extends Controller {
  static targets = ['pie']

  connect() {
    console.log("Hello from pie controller.js");
  }

  fire() {
    console.log("fire");
    const newsArticles = {
      "BBC": 10,
      "Politico": 20,
      "Al Jazeera": 10
    };

    const labels = Object.keys(newsArticles);
    const data = Object.values(newsArticles);
    this.buildPie(labels, data);
  }

  buildPie(labels, data) {
    console.log("build pie");
    this.pieTarget.innertext = new Chart(this.pieTarget, {
      type: 'pie',
      data: {
        labels: labels,
        datasets: [{
          label: 'News Ratio',
          data: data,
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)'
          ],
          hoverOffset: 4
        }]
      }
    });
  }
}
