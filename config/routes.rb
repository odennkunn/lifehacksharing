Rails.application.routes.draw do

  devise_for :users

  constraints ->  request { request.session[:user_id].present? } do
    root to: "articles#index"
  end

  root to: 'top#index'

  resources :articles do
    collection do
      get 'dele'
    end
  end

  resources :users
end
