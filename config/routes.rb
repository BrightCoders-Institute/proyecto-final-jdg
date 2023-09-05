Rails.application.routes.draw do
  get 'faqs/index'
  get 'about/index'
  get 'home/index'

  devise_for :users
  resources :users, only: [:show, :edit, :update], path: 'profile'

  resources :products do
    member do
      post 'add_to_cart'
    end
  end

  resources :carts do
    delete 'remove_product/:line_item_id', to: 'carts#remove_product', on: :member, as: :remove_product
    post 'checkout', on: :collection
  end

  resources :orders, only: [:index, :show]

  resources :addresses do
    member do
      delete 'delete_address'
      get 'details'
    end
  end

  resources :adminorders

  root "home#index"
end
