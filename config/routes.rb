Rails.application.routes.draw do

  apipie
  resources :managers
  resources :cooks
  resources :users
  resources :menu_items
  resources :orders
  resources :cash_desks
  
  
  root 'home#index'
end
