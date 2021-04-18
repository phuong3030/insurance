Rails.application.routes.draw do
  resources :users, only: [:index, :create] do
    resources :contracts do
      get :premium
      resources :invoices, except: [:update, :edit]
    end
  end

  root to: "users#index"
end
