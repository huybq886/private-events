Rails.application.routes.draw do
  root "users#index"

  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'users/:id' => 'users#show', :as => @user
  get 'new_event' => 'events#new', as: 'new_event'

  resources :users, only: [:index, :new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:index, :new, :show, :create] do
    member do
      get 'rsvp'
      get 'cancel_rsvp'
    end
  end
end
