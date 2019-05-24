Rails.application.routes.draw do
  resources :villagers

  root 'application#index'
end
