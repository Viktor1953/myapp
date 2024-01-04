Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms
  # get 'users/index'
  # get 'users/show'
  
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'

  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]

  # root 'pages#index'
  resources :pins
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
