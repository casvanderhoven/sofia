Rails.application.routes.draw do
  root 'authors#index'

  resources :authors do
    resources :works do
      resources :chapters do
        resources :sections
      end
    end
  end
end
