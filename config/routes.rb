Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :posts, only: %i[create destroy edit update] do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
