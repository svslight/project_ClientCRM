Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations' }

  get :search, to: 'search#index'

  root to: "clients#index"

  match '/countries/cancel', to: 'countries#cancel', via: 'get'

  resources :clients, :countries, :statuses, :group_statuses, :groups, :group_positions, 
            :projects, :team_positions, :users, :roles
end
