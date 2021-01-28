Rails.application.routes.draw do
  devise_for :users
  root 'home#index' # no home controller yet
end
