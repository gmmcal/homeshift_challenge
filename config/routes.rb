Rails.application.routes.draw do
  root to: 'application#index'

  resources :houses do
    collection do
      get 'available', to: 'houses#available', as: :available
    end
  end
  resources :people
end
