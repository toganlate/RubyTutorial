Rails.application.routes.draw do
  get "/products", to: "products#index" 
  get "up" => "rails/health#show", as: :rails_health_check
  post "/products", to: "products#create"
  patch "/products/:id", to: "products#update", as: "update_product" # PATCH is used in rails in place of "Update" 
  delete "/products/:id", to: "products#delete", as: "delete_product"
  get "/users", to: "users#index"
  post "/users", to: "users#create"
  patch "/users/:id", to: "users#update", as: "update_user" # PATCH is used in rails in place of "Update" 
  delete "/uers/:id", to: "users#delete", as: "delete_user"
end

