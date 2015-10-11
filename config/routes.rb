Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :questions, only: [:new, :create, :show, :index, :update] do
    resources :answers, only: [:new, :create]
  end
  resources :votes
  resources :categories, only: :show
end
