# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :posts, only: %i[create destroy edit update] do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :users, only: %i[index show]
end
