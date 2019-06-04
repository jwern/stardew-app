Rails.application.routes.draw do
  resources :villagers
  get 'application/index'

  root 'villagers#index'
end
