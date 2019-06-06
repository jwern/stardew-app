Rails.application.routes.draw do
  #get 'items/new'
  get 'items/index'
  get 'villagers/index'
  resources :items
  resources :villagers
  get 'application/index'

  root 'villagers#index'
end
