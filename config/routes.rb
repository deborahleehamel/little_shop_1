Rails.application.routes.draw do

  root to: "pages#splash"

  # resources :items, only: [:index, :show]
  get "/items", to: "items#index"
  get "/items/:id", to: "items#show", as: "item"

  # resources :users, only: [:new, :create]
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "users"

  resources :cart_items, only: [:create, :destroy, :update, :edit]
  resources :orders, only: [:index, :create]

  namespace "admin" do
    resources :items
    resources :users, only: [:show]
  end

  get "/order", to: "orders#show"
  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/cart", to: "cart_items#index"
  get "/admin/dashboard", to: "admin/users#show"
  get "/:category", to: "categories#show"
  get "/*page", to: "errors#not_found"
end
