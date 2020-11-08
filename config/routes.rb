Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'dashboard#index'
  
  get 'dashboard', to: 'dashboard#index'
  get 'leaderboard', to: 'leaderboard#index'

  resources :teachers, only: %w[index create]
  resources :subscriptions, only: %w[index show create]
  resources :votes, only: %w[create]

  resources :courses, only: %w[index show] do
    resources :subscriptions, only: %w[index new]
    resources :teachers, only: %w[index new]
  end

  get ':votable_type/:votable_id/votes', to: 'votes#index'
end
