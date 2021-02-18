Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :index, :show]
  resources :order, only: [:index] do
    resources :address, only: [:create]
  end
end
