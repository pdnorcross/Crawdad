Rails.application.routes.draw do
   root 'home#index'
  resources :home
  resources :customers do
    collection do
      get :search
    end
  end
  resources :reports
  resources :volunteers
  end
