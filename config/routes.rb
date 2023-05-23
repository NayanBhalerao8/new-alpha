Rails.application.routes.draw do
  # get 'pages/about'
  resources :users
  resources :articles
  root 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
