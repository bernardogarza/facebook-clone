Rails.application.routes.draw do
  authenticated :user do
    root 'homes#index'
    resources :posts, only: %i[create destroy edit update]
    resources :users, only: %i[index show]
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  devise_for :users
end