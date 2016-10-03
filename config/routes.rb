Rails.application.routes.draw do
  get 'dashboard/dashboard'

  get 'home/index'

  get 'users/new'
  
  get 'users/create'
  
  post 'users/create'
  
  get 'users/login'
  
  post 'users/login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
