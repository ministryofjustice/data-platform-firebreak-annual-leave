Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  get 'home/index'
  resources :leave_records, only: %i[index new create show destroy]
  get '/leave_records/:id/confirm_delete', to: 'leave_records#confirm_delete', as: 'confirm_delete_leave_record'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
