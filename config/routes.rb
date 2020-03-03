Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'profile', to: 'profiles#show'
  resource :profile, only: [:new, :create]


  resources :groups
  resources :bets, except: [:destroy]
end
