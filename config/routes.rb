Rails.application.routes.draw do
  root 'home#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :update, :edit, :show] do
    get 'office', to: 'users#office', on: :member
  end

  resources :surveys do
    resources :nominations, only: [:new, :create]
    resources :winners, only: [:new, :create]
  end

  resources :winners, only: :index
end
