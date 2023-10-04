Rails.application.routes.draw do
  get 'testingg/index'
  # get 'pages/about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new,:index]
  get 'users', to: 'users#index', as: 'all_users'
  resources :articles
  root 'pages#home'
  mount Crono::Engine, at: '/crono'

  # for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
