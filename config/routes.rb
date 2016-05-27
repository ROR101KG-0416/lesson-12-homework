Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  resources :neighborhoods
  resources :categories

  root 'restaurants#index'
end
