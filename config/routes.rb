Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  namespace :manage do
    resources :users
  end

  resources :roles

  get 'histories', to: 'histories#index'
  root 'home#index'
end
