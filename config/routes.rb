Rails.application.routes.draw do

  devise_for :users

  root to: 'top#index'

  resources :articles do
    resources :comments, only: [:create]
  end

  resources :users
end
