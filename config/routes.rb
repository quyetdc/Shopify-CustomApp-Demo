Rails.application.routes.draw do
  root :to => 'products#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'products', to: "products#index", as: :products
  get 'products/:id', to: "products#show", as: :product
end
