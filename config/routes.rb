Rails.application.routes.draw do
  get 'signup', to: 'users#new',        as: 'signup'
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'users',  to: 'users#show',       as: 'users'
  
  get 'sessions/new'

  resources :users do
    member do
      get :following, :followers
    end
  end 

  get 'welcome/index', to: 'welcome#index', as: 'welcome'

  resources :tweets
  

  resources :tweets do
    resources :repplies    
  end

  resources :relationships, only: [:create, :destroy]
  
  
  resources :sessions
  
  
  root 'welcome#index'
end
