Rails.application.routes.draw do

  devise_for :users

  root to: 'top#index'

  resources :articles do
    resources :comments, only: [:create]
    collection do
      get 'search'
      get 'cook'
      get 'clean'
      get 'beauty'
      get 'other'
      get 'rank'
    end
  end

  resources :users, only: [:show]

  post '/articles/:article_id/likes' => "likes#create"
  delete '/articles/:article_id/likes' => "likes#destroy"
end
