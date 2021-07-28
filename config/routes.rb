Rails.application.routes.draw do
  
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
  root "home#page"
  get '/artists', to: "artists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
