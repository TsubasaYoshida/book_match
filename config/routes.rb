Rails.application.routes.draw do
  resources :books, except: [:edit] do
    collection do
      get :narrow
    end
  end
  resources :reviews
  resources :users
  root to: 'books#index'
end
