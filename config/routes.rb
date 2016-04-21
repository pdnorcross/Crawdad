Rails.application.routes.draw do
   root 'home#index'

  resources :volunteers do
    collection do
      post :signed_in
    end

  end

   resources :home
   resources :customers
   resources :reports

  end
