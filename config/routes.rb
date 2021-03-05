Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  # show show routes and index routes
  resources :articles #, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
