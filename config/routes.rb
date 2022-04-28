Rails.application.routes.draw do
  root "sessions#welcome"


  resources :adboards, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: "sessions#logout"
  resources :ad_view, only: [:index]


  get 'authorized', to: 'sessions#page_requires_login'


end
