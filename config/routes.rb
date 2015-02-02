Rails.application.routes.draw do


  root to: 'pages#home'
  devise_for :users, :controllers => { :users => 'devise/invitations' }

  # Main Models


  resources :users
  resources :categories

  resources :tickets do
    resources :comments, :controllers => { :comments => 'tickets' }, :only => [:create, :destroy]
  end
  resources :projects do
    resources :tasks, :controllers => { :tasks => 'projects' }
  end


  # Get User Profile
  #get 'users#show'


  # Using high_voltage gem I feel like there is a way we can loop
  #  through the files within Pages to take care of these routes for us.
  # Static Pages can pile up quick
  # Static Pages - Main
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/features' => 'high_voltage/pages#show', id: 'features'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'

  # Static Pages - Service Information
  get '/task-management'    => 'high_voltage/pages#show', id: 'task-management'




  # Admin Namespace - a whole different set of controllers within /admin to have
  #  full control of all methods
  namespace :admin do
    resources :users

    devise_scope :user do
      resources :invitations
    end
    get 'dashboard' => 'dashboard#index'
    root to: 'dashboard#index'
  end


end
