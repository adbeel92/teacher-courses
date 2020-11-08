Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'dashboard#index'
  
  get 'dashboard', to: 'dashboard#index'
  get 'leaderboard', to: 'leaderboard#index'

  resources :teachers, only: %w[index create]
  resources :subscriptions, only: %w[index create]

  resources :courses, only: 'index' do
    resources :subscriptions, only: %w[index new]
    resources :teachers, only: %w[index new]
  end
end
