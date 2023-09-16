Rails.application.routes.draw do
  get 'admin_view/index'
  devise_for :users

  resources :users, only: [:show, :edit, :update], path: 'profile'

  root 'home#index'

  resources :addresses
  resources :carts do
    delete 'remove_product/:line_item_id', to: 'carts#remove_product', on: :member, as: :remove_product
    post 'checkout', on: :collection
  end
  resources :products do
    member do
      post 'add_to_cart'
    end
  end
  resources :orders, only: [:index, :show]
  resources :adminorders
  resources :brands
  resources :caps
  resources :pins
  resources :cases

  get 'home/index'
  get 'faqs/index'
  get 'about/index'
end
