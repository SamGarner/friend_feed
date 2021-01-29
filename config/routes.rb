Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:index, :create, :destroy]
  root 'posts#index'
end
