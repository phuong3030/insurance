Rails.application.routes.draw do
  resources :users, only: [:index, :create] do
    resources :contracts do
      get :premium
      resources :properties
    end

    resources :invoices, only: [:index, :create, :show]
  end


  root to: "users#index"
end
