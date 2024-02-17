Rails.application.routes.draw do
  get "leads/index"
  get "users/new"
  get "users/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :leads
  # Defines the root path route ("/")
  root "leads#index"
  resources :users

  get "login" => "user_sessions#new", :as => :login
  post "login" => "user_sessions#create"
  post "logout" => "user_sessions#destroy", :as => :logout
end
