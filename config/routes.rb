Rails.application.routes.draw do
  root "leads#index"
  resources :users
  resources :leads
  resources :lead_details

  get "login" => "user_sessions#new", :as => :login
  post "login" => "user_sessions#create"
  post "logout" => "user_sessions#destroy", :as => :logout
end
