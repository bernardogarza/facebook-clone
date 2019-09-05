Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  authenticated :user do
    root 'homes#index'
  end

  devise_for :users
  resources :posts, only: %i[create destroy edit update]
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end