Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :update, :edit]
  resources :surveys do
    get 'nominate', to: 'surveys/nominations#new', param: :survey_id, as: :nomination
    post 'nominations', to: 'surveys/nominations#create', param: :survey_id
  end
end
