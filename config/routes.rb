Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'top#index'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'user_agreement', to: 'pages#user_agreement'
  get 'contact', to: 'pages#contact'
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get '/menu', to: 'menu#index', as: 'menu'
  resources :users, only: %i[new create]
end
