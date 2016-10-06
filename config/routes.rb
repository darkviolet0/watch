Rails.application.routes.draw do

  match '/searchct', to: 'sites#search', via: [:get]
  resources :cycle_track_comments
  root to: 'visitors#new'
  
  resources :themes
  resources :sites do
    collection do
      get 'searchct'
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    resources :sites, :themes
  end
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get '/login' => 'pages#login'
  
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  

end
