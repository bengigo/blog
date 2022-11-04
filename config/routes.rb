# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/users/:id", to: "users#show"
  get "users/:id/posts", to: "posts#index"
  get "users/:id/posts/:id", to: "posts#show"
  get "/posts/new", to: "posts#new"
  post "posts/new", to: "posts#create"
  get '/comments/new', to: "comments#new"
  post '/comments/new', to: "comments#create"
  post '/likes/new', to: "likes#create"
end
