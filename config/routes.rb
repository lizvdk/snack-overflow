Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :questions, only: [:new, :create, :show]
end
