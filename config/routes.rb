Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  
  root 'static_pages#home'
end
