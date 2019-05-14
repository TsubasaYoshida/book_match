Rails.application.routes.draw do
  resources :books, except: [:edit]
  root to: 'books#index'
end
