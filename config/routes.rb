Rails.application.routes.draw do
   root 'home#index'
  resources :home
  resources :customers
  resources :reports
  resources :dependents
  resources :volunteers
  end
