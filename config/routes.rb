Rails.application.routes.draw do
  resources :invoices, except: [:update, :edit]
  resources :contracts
  resources :users

  root to: "users#index"
end
