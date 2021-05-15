Rails.application.routes.draw do
  #root 'articles#index'
   root 'pages#home'

  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # add routes here to see in expanded view
  resources :articles
  # syntax to expose only a few routes
  # = resources :articles , only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # RESTful routes; mapping of HTTP verbs GET, POST, PATCH, PUT to backend CRUD operations
  # mapping any front end request

end
