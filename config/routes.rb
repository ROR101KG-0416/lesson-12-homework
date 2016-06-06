Rails.application.routes.draw do
  resources :restaurants
  resources :neighborhoods

  root 'restaurants#index'
end
