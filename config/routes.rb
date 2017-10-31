Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  namespace :manage do
    resources :users
  end

  resources :roles

  root 'home#index'
end
