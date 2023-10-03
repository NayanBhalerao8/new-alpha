Rails.application.routes.draw do
  get 'testingg/index'
  # get 'pages/about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles
  root 'pages#about'
  mount Crono::Engine, at: '/crono'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
