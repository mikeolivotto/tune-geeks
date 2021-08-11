Rails.application.routes.draw do

  post 'payment/page', to: "payment#create", as: 'payment'
  get 'orders/new', to: "orders#new", as: :new_order
  post 'order', to: "orders#create"
  get 'orders', to: "orders#index"
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
  root "home#page"
  get 'artists', to: "artists#index"
  get 'artists/:id', to: "artists#show", as: :artist
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
