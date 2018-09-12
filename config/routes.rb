Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/products" => "products#index"

  get "/products/new" => "products#new"

   post "/products" => "products#create"

  get "/products/:id" => "products#show"

   get "/products/:id/edit" => "products#edit"

  patch "/products/:id" => "products#update"

  delete "/products/:id" => "products#destroy"


 namespace :api do 
  get "/products" => "products#index"

   get "/products/:id" => "products#show"

  patch "products/:id" => "products#update"


  post "/products" => "products#create"

  get "/acoustic" => "products#acoustic"

  get "/electric" => "products#electric"

  get "/bass" => "products#bass"

  get "/segment/:this_variable" => "products#segment"


  get "/products/:id" => "products#show"


  get "/suppliers" => "suppliers#index"



  post "/suppliers" => "suppliers#create"



  get "/images" =>

  "images#index"


  post "/images" =>

  "images#create"


  post "/users" => "users#create"

 post "/sessions" => "sessions#create"


 post "/orders" => "orders#create"

  get "/orders" => "orders#index"


  get "/v1/products" => "products#index"



 post "/cartedproducts" => "carted_products#create"

 get "/cartedproducts" => "carted_products#index"

 delete "/cartedproducts/:id" => "carted_products#destroy"


 delete "/orders/:id" => "orders#destroy"

  
 end 
end
