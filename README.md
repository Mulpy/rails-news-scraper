Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
Project description goes here

This project started as an idea to help my wife with her research work. My wife has to keep up to date with the latest news for her job and has to search across multiple news websites to do so. I wanted to create an app that would allow her to input one search and find relevant news articles from multiple sources. News Scraper compiles the latest news headlines from Google News. It uses Nokogiri to scrape the web and Rails to display the data. Users can search for news terms across the following websites: BBC, Politico,  The New York Times, The Japan Times and the Associated Press (AP). It also calls on a free API to display historical facts about the current date.  Users can also sign in to bookmark their favorite articles and add both a rating and comments to their favorite articles. 

I am using this website as a sandbox to learn new development skills and test out code.  I am currently experimenting with adding a chat page function to the app and integrating a strict Content Security Policy (CSP) while maintaining functionality. So apologies if I occasionally break the website!!!

The hardest part of designing this app was definitely utilizing Nokogiri to scrape multiple websites simultaneously. They all had different classes for their HTML divs and so I had to change the function code for each news website. I have found it impossible to scrape from websites that use double-underscores as part of their class lists "__": but I hope to overcome this challenge in the future.  I was also originally focussed on testing the scraping functionality so did not design for 'mobile first' and as a result had to overhaul my styles to make the app look better as a PWA.

I enjoyed using JavaScript to create some interactive elements with the web app such as filtering the search results and displaying results in a pie chart. However, when I first started experimenting with adding a Content Security Policy (CSP) it disabled many of the JavaScript features - this affected the pie chart and so I ultimately decided to remove it as I did not feel it added much value and was proving to be difficult to integrate with the CSP.

My focus with this app is to upskill at back-end development and adding functionality to the app.  I am less focused on front-end design so apologies for the less polished look to the website.  Once I am satisfied with the back-end features then I will start to try to make the app look better.

Also, the search function relies on CSS selectors from news websites.  If the websites update or change classes then I will no longer be able to scrape them until I update my code so I will occasionally lose access to websites.

<br>
<img width="350" alt="news_scraper_home" src="https://github.com/Mulpy/rails-news-scraper/assets/134996929/3449a9f5-4c5a-4682-ad73-704744dc4a10">
<br>
<img width="350" alt="news_scraper_search3" src="https://github.com/Mulpy/rails-news-scraper/assets/134996929/c56f2aa0-8011-4a3a-960e-6c69d14ce9d0">
<br>
<img width="350" alt="news_scraper_search2" src="https://github.com/Mulpy/rails-news-scraper/assets/134996929/c398cb93-5a62-4d31-9394-8e423017a531">
<br>
<img width="350" alt="news_scraper_search" src="https://github.com/Mulpy/rails-news-scraper/assets/134996929/4cc50034-f55c-4a35-ba7f-1df3136bbeab">
<br>
<img width="350" alt="news_scraper_home2" src="https://github.com/Mulpy/rails-news-scraper/assets/134996929/9ca8e73e-e9c4-4284-9a74-ffc996b0c772">
<br>
App home: https://news-scraped-048c75f1e983.herokuapp.com
   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
```
RAPID_API_KEY=<Your Key Here>
```


### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Nokogiri](https://nokogiri.org/) - Web Scraping
- [RapidAPI](https://rapidapi.com/hub) - API 

## Acknowledgements
The Le Wagon Tokyo Teaching Staff

## Team Members
- [Gary Topping](www.linkedin.com/in/gary-topping)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
