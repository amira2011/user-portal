Rails.application.routes.draw do
  get "leads/index"
  get "users/new"
  get "users/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  # Defines the root path route ("/")
  root "leads#index"
end
