Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'top#index'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'user_agreement', to: 'pages#user_agreement'
  get 'contact', to: 'pages#contact'
  # Defines the root path route ("/")
  # root "posts#index"
end
