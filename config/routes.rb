Rails.application.routes.draw do
  get 'faqs/index'
  get 'about/index'

  get 'orders/index'
  get 'orders/show'

  devise_for :users

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :addresses, :carts, :products, :adminorders, :brands

  resources :products do
    member do
      post 'add_to_cart'
    end
  end
  
  resources :carts do
    delete 'remove_product/:line_item_id', to: 'carts#remove_product', on: :member, as: :remove_product
  end

  resources :orders, only: [:index, :show]
  post 'carts/checkout', to: 'carts#checkout', as: 'checkout'

end
