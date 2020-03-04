Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'dashboard', to: 'profiles#dashboard'
  get 'checkout', to: 'pages#checkout'
  get 'thankyou', to: 'profiles#thankyou'
  resource :profile, only: [:new, :create]
  resources :groups
end
