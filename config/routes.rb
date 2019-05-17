Rails.application.routes.draw do
  resources :books, except: [:edit]
  resources :reviews
  resources :users
  root to: 'books#index'
end
