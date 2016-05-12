Rails.application.routes.draw do
   root 'home#index'
  resources :home
  resources :customers
  resources :reports do
    collection do
      post :generate_reports
    end
  end
  resources :volunteers


   namespace :api, defaults: { format: 'json' } do
     namespace :v1 do
       resources :reports, except: [:index, :new, :create, :show, :edit, :update, :destroy] do
         collection do
           post :generate_reports
         end
       end

     end
   end
  end
