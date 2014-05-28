Rails.application.routes.draw do
  resources :surveys
  resources :attempts, :only => [:new, :create], controller: 'contests'
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, :only => [:show, :edit, :update, :index]
  match '/users/:id/add_email' => 'users#add_email', via: [:get, :patch, :post],
    as: :add_user_email
  root to: 'contests#new'
end
