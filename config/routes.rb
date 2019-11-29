Rails.application.routes.draw do

  devise_for :users

  root to: 'top#index'

  resources :articles do
    collection do
      get 'dele'
    end
  end

  resources :users
end
