Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"``
  get "/dashboard", to: "users#dashboard"
  resources :organs do
    resources :reviews, only: %i[new create edit update destroy]
    resources :bookings, only: %i[create update destroy]
  end
end
