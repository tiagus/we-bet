Rails.application.routes.draw do

  root to: 'pages#home'
  get 'messages/index'
  get 'conversations/index'
  devise_for :users, controllers: { registrations: "registrations" }

  get 'dashboard', to: 'profiles#dashboard'
  patch 'dashboard', to: 'profiles#update'
  get 'checkout', to: 'pages#checkout'
  get 'thankyou', to: 'pages#thankyou'
  resource :profile, only: [:new, :create]
  resources :groups
  resources :bets, only: [:create]
  resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :create]
  end
end
