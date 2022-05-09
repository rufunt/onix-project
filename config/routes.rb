Rails.application.routes.draw do

  # apipie

  devise_for :cooks
  
  resources :cooks
  resources :managers
  resources :users
  resources :menu_items
  resources :orders
  resources :cash_desks

  root 'home#index'
end
