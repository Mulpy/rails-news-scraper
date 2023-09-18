Rails.application.routes.draw do
  get 'news_articles/index'
  get 'news_scraper/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "news_articles#index"
  resources :news_articles, only: %i[index]
end