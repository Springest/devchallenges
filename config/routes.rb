Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get '/users/:id/add_email' => 'users#add_email', via: [:get, :patch, :post],
    as: :add_user_email
end
