Rails.application.routes.draw do
  root 'home#index'
  
  get 'dashboard/dashboard'

  get 'home/index'

  get 'users/new'
  
  get 'users/create'
  
  post 'users/create'
  
  get 'users/login'
  
  post 'users/login'
  
  get 'preferences/password'
  
  post 'preferences/password'

  get 'preferences/preferences'
  
  post 'preferences/preferences'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
