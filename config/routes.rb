Rails.application.routes.draw do
   root 'home#index'
  resources :home
  resources :customers
  resources :reports
  end
