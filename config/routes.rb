Rails.application.routes.draw do

  root to: "static_pages#home"

  resources :categories

  resources :applicants
  resources :listings


  resources :sessions, only: [:new, :create, :destroy]

  match "/home",    to: "static_pages#home",    via: "get"
  match "/about",   to: "static_pages#about",   via: "get"
  match "/contact", to: "static_pages#contact", via: "get"

  match "/register", to: "users#new",          via: "get"
  match "/signin",   to: "sessions#new",       via: "get"
  match "/signout",  to: "sessions#destroy",   via: "get"
  match "/dashboard", to: "user#show", via:"get"

  namespace :business do
    resources :listings
  end

  namespace :administrator do
    get "/paid" => "orders#paid", as: :paid
    get "/ordered" => "orders#ordered", as: :ordered
    get "/cancelled" => "orders#cancelled", as: :cancelled
    get "/completed" => "orders#completed", as: :completed
    get "/cancel/:id" => "orders#cancel", as: :cancel
    get "/complete/:id" => "orders#complete", as: :complete
    resources :cart_items
    resources :admins
    resources :items
    resources :categories
    resources :orders
    resources :users
  end
end
