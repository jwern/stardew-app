Rails.application.routes.draw do
  get 'notes/index'
  #get 'items/new'
  get 'items/index'
  get 'villagers/index'
  resources :items
  resources :villagers
  resources :preferences
  resources :notes
  get 'application/index'

  root 'notes#index'
end
