Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root 'users#index'
  
  resources :users, only: [:index, :show, :destroy] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
      get 'likes', to: 'likes#like', on: :member
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index], format: :json do 
          resources :comments, only: [:index], format: :json 
        end
      end
    end
  end
  
end
