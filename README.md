Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
Project description goes here

This project started as an idea to help my wife with her research work. My wife has to keep up to date with the latest news for her job and has to search across multiple news websites to do so. I wanted to create an app that would allow her to input one search and find relevant news articles from multiple sources.

The hardest part of designing this app was definitely utilizing Nokogiri to scrape multiple websites simultaneously. They all had different classes for their HTML divs and so I had to change the function code for each news website. I have found it impossible to scrape from websites that use double-underscores as part of their class lists "__": but I hope to overcome this challenge in the future.

I enjoyed using JavaScript to create some interactive elements with the web app such as filtering the search results and displaying results in a pie chart. I will continue to work on the styling of the website and to update with extra features that users find useful. 

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
N/A
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
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
The Le Wagon Tokyo Teaching Staff

## Team Members
- [Gary Topping](www.linkedin.com/in/gary-topping)
- [Alvin (Ken) Yau]()
- [James Lau]()
- [Ritsuki Toshima]()

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
