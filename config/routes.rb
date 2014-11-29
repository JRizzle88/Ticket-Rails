Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, :controllers => { :users => 'devise/invitations' }


  resources :tickets do
    resources :comments, :controllers => { :comments => 'tickets' }, :only => [:create, :destroy]
  end

  resources :users
  resources :categories

  # Get User Profile
  #get 'users#show'

  # Static Pages
  get '/glyphicons'    => 'high_voltage/pages#show', id: 'glyphicons'
  get '/features'    => 'high_voltage/pages#show', id: 'features'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'

  namespace :admin do
    resources :users

    devise_scope :user do
      resources :invitations
    end
    get 'dashboard' => 'dashboard#index'
    root to: 'dashboard#index'
  end


end
