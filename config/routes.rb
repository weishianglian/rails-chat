Rails.application.routes.draw do
  root 'chat#index'
  get 'chat/index'
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
