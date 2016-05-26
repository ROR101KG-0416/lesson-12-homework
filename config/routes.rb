Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, :neighborhoods, :categories

  root 'restaurants#index'
end
