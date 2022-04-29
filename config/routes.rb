Rails.application.routes.draw do

  resources :managers
  resources :cooks
  resources :users
  resources :menu_items
  resources :orders
  root 'home#index'
end
