# frozen_string_literal: true

Rails.application.routes.draw do

    devise_for :users, controllers: {
      confirmations: 'users/confirmations'
    }
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create]
      resources :likes, only: [ :create, :new]
    end
  end
end
