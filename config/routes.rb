Rails.application.routes.draw do

  resources :managers
  resources :cooks
  resources :users
  root 'home#index'
end
