Rails.application.routes.draw do

  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end

  resources :votes, only: [:create]

  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'

  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
