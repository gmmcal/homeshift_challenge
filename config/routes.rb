Rails.application.routes.draw do
  root to: 'application#index'

  resources :houses do
    collection do
      get 'available', to: 'houses#available', as: :available
    end

    member do
      get 'assign', to: 'houses#assign', as: :assign
      patch 'assign/:person_id', to: 'houses#patch_assign', as: :patch_assign
    end
  end
  resources :people do
    member do
      patch 'vacate', to: 'people#vacate', as: :vacate
    end
  end
end
