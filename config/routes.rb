Rails.application.routes.draw do
   root 'home#index'
  resources :home
  resources :customers
  resources :reports
  resources :dependents
   resources :volunteers do
     collection do
       post :post_request_sign_in
       post :request_sign_in
     end
   end
  end
