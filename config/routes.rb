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
  resources :news_articles, only: %i[index show]
  resources :user_news_articles, only: %i[index destroy]
  resources :bookmarks
  resources :chatrooms, only: %i[index show create] do
    resources :messages, only: :create
  end
end
