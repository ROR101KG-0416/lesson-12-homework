Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  resources :neighborhoods

  root 'static_pages#home'
end
