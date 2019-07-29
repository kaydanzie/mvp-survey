Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :update, :edit]
  resources :surveys do
    get 'nominate', to: 'nominations#new', on: :member
  end

  resources :nominations, only: :create
end
