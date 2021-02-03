Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only: [:index, :show]
  # resources :friend_requests, only: [:index, :create, :destroy]
  resources :friendships, only: [:index, :create, :update, :destroy]
  resources :notifications, only: :index
  resources :comments, only: [:index, :create, :edit, :update, :destroy]
  root 'posts#index'
end
