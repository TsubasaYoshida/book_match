Rails.application.routes.draw do
  resources :books, except: [:edit]
  resources :reviews
  root to: 'books#index'
end
