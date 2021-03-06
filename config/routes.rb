Rails.application.routes.draw do
  devise_for :users

  root to: "clients#index"

  match '/countries/cancel', to: 'countries#cancel', via: 'get'
  
  resources :clients,  :countries  
end
