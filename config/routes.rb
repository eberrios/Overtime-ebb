Rails.application.routes.draw do
  resources :audit_logs, except: %i[new edit destory]
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users
    resources :owner_users

    root to: 'users#index'
  end
  resources :posts
  devise_for :users, skip: [:registrations]
  root 'static#home'
end
