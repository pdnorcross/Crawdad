Rails.application.routes.draw do
   root 'home#application'
  resources :customers
end
