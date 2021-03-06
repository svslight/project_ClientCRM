Rails.application.routes.draw do
  devise_for :users

  root to: "clients#index"

  match '/countries/cancel', to: 'countries#cancel', via: 'get'
  
  resources :clients, :countries, :statuses, :group_statuses, :groups, :group_positions, :projects, :team_positions

end
