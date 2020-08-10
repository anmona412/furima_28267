Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    resources :transactions, only: [:index ,:create]
  end
  resources :bought_bies
end
