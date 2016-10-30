Rails.application.routes.draw do
  get 'ingredientes/create'

  get 'ingredientes/edit'

  get 'ingredientes/remove'

  root 'home#index'
  
  get 'session/require_login'
  
  get 'session/logout'
  
  get 'dashboard/dashboard'

  get 'home/index'
  
  get 'home/' => 'home#index'

  get 'users/new'
  
  get 'users/create'
  
  get 'password_resets/edit'
  
  post 'users/create'
  
  get 'users/login'
  
  post 'users/login'
  
  resources :users do
    member do
        get :confirm_email
    end
  end

  get 'preferences/password'
  
  post 'preferences/password'

  get 'preferences/preferences'
  
  post 'preferences/preferences'

  resources :password_resets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
