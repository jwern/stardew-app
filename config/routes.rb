Rails.application.routes.draw do
  get 'games/new'
  get 'notes/index'
  #get 'items/new'
  get 'items/index'
  get 'villagers/index'
  resources :items
  resources :villagers
  resources :preferences
  resources :notes
  resources :games
  get 'application/index'

  root 'notes#index'
end
