Rails.application.routes.draw do
  resources :villagers
  get 'application/index'

  root 'application#index'
end
