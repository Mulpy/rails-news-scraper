Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/show'
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  devise_for :users
  get 'news_articles/index'
  get 'news_scraper/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "news_articles#index"
  resources :news_articles, only: %i[index show destroy]
  resources :bookmarks, only: %i[index show new create destroy]
end
