Rails.application.routes.draw do
  root 'users#index'
  get "users", to: "users#index"
  get "users/:id", to: "users#show"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
