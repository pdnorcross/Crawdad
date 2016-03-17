Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

   root 'sessions#new'
  resources :home
  resources :customers
  resources :reports
  resources :volunteers
  end
