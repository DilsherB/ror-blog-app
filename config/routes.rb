Rails.application.routes.draw do
  root 'users#index'
  # get "users", to: "users#index"
  # get "users/:id", to: "users#show"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create, :destroy]
      get 'likes', to: 'likes#like', on: :member
    end
  end
end
