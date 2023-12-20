Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  get 'home/index'
  resources :leave_records, only: [:new, :create, :show]
  
  get 'up' => 'rails/health#show', as: :rails_health_check
  
end
