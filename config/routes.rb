Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'registrations' }
  resources :posts
  resources :users, only: [:index, :show, :edit, :update]
  resources :likes, only: [:create]
  # resources :friend_requests, only: [:index, :create, :destroy]
  resources :friendships, only: [:index, :create, :update, :destroy]
  resources :notifications, only: :index
  resources :comments, only: [:index, :create, :edit, :update, :destroy]
  root 'posts#index'
end
