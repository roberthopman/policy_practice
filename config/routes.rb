Rails.application.routes.draw do
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'autologin/:id', to: 'user_sessions#autologin', as: 'autologin'
  get 'admin' => 'admins#index', as: 'admin'

  resources :users

  root "entries#index"
  resources :entries
end
