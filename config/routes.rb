Rails.application.routes.draw do
  devise_for :users

  resources :contracts, only: [:index, :show, :create ] do
    get :premium
    resources :properties
    resources :invoices, only: [:index, :create, :show]
  end

  root to: "contracts#index"
end
