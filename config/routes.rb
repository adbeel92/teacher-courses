Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'dashboard#index'
  
  get 'dashboard', to: 'dashboard#index'
  get 'leaderboard', to: 'leaderboard#index'

  resources :teachers
  resources :courses
end
