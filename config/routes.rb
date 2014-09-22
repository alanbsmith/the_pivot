Rails.application.routes.draw do

  root to: "static_pages#home"

  resources :categories
  resources :cart_listings
  resources :users
  resources :listings
  resources :orders
  resources :resumes

  resources :sessions, only: [:new, :create, :destroy]

  get    '/cart',   to: 'carts#show', as: 'cart'
  delete '/cart',   to: 'carts#destroy'

  match "/home",    to: "static_pages#home",    via: "get"
  match "/about",   to: "static_pages#about",   via: "get"
  match "/contact", to: "static_pages#contact", via: "get"

  match "/register", to: "users#new",          via: "get"
  match "/signin",   to: "sessions#new",       via: "get"
  match "/signout",  to: "sessions#destroy",   via: "get"
  match "/dashboard", to: "users#show", via:"get"

  namespace :users do
    resources :orders
    resources :cart_listings
  end
  
end
