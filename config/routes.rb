Rails.application.routes.draw do
  resources :leave_periods
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  get 'home/index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
