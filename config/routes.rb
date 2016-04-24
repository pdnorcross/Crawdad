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

   namespace :api, defaults: { format: 'json' } do
     namespace :v1 do
       resources :volunteers, except: [:index, :new, :create, :show, :edit, :update, :destroy] do
         collection do
           post :signed_in
         end
       end

     end
   end
end


