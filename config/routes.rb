Rails.application.routes.draw do
  root to: 'application#index'

  resources :houses
  resources :people
end
