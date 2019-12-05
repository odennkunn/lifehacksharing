Rails.application.routes.draw do

  devise_for :users

  root to: 'top#index'

  resources :articles do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show]
end
