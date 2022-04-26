Rails.application.routes.draw do

  resources :managers
  resources :users
  root 'home#index'
end
