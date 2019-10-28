Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :update, :edit, :show]
  resources :surveys do
    resources :nominations, only: [:new, :create]
    resources :winners, only: [:new, :create]
  end
end
