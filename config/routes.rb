Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  get 'home/index'
  get 'calendar', to: 'calendar#index'
  resources :leave_records, only: %i[index new create show destroy]
  resources :teams, only: %i[index new create show destroy]
  get '/teams/:id/confirm_delete', to: 'teams#confirm_delete', as: 'confirm_delete_team'
  get '/leave_records/:id/confirm_delete', to: 'leave_records#confirm_delete', as: 'confirm_delete_leave_record'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
