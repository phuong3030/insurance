Rails.application.routes.draw do
  devise_for :users

  resources :contracts, only: [:index, :show, :create ] do
    resources :properties
    resources :invoices, only: [:index, :create]
  end

  root to: "contracts#index"
end
