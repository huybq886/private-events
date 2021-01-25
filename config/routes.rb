Rails.application.routes.draw do
  root "users#index"

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'users/:id' => 'users#show', :as => @user

  resources :users, only: [:index, :new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
