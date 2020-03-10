Rails.application.routes.draw do

  root to: 'pages#home'
  get 'messages/index'
  devise_for :users, controllers: { registrations: "registrations" }

  get 'dashboard', to: 'profiles#dashboard'
  patch 'dashboard', to: 'profiles#update'
  get 'checkout', to: 'pages#checkout'
  get 'thankyou', to: 'pages#thankyou'
  resources :orders, only: [:show, :create]
  resource :profile, only: [:new, :create]
  resources :bets, only: [:create]
  resources :groups do
    resources :messages, only: [:index, :create]
    end
end
