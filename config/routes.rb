Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "books#last_books"
  resources :categories, only: [:show]
  resources :books
  get "last_books", to: "books#last_books", via: "get"
end
