Rails.application.routes.draw do
  resources :restaurants, :neighborhoods, :categories

  root 'restaurants#index'
end
