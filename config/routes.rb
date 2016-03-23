Rails.application.routes.draw do
   root 'home#index'
  resources :home
  resources :customers
  resources :reports


   resources :volunteers, except: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      post :submit_hours
    end
  end


  end
