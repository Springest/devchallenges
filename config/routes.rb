Rails.application.routes.draw do
  # Frontend routes
  resources :surveys
  resources :attempts, :only => [:new, :create]

  # Admin routes
  namespace(:admin) do
    resources :surveys
  end

  # Admin Users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Frontend Users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get '/users/:id/add_email' => 'users#add_email', via: [:get, :patch, :post],
    as: :add_user_email

  # Homepage
  root to: 'contests#new'
end
