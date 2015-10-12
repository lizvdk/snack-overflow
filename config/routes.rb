Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :questions, only: [:new, :create, :show, :index] do
    resources :answers, only: [:new, :create, :update]
  end
  resources :votes
  resources :categories, only: :show
end
