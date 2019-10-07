Rails.application.routes.draw do
  get 'games/new'
  get 'notes/index'
  #get 'items/new'
  get 'items/index'
  get 'villagers/index'
  resources :games do
    resources :items
    resources :villagers
  end
  resources :preferences
  resources :notes
  get 'application/index'

  root 'games#index'
end
