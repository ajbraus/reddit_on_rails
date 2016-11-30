Rails.application.routes.draw do
  
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destory]

  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
