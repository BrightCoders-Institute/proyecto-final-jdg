Rails.application.routes.draw do
  resources :products
  devise_for :users

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :addresses

  resources :products do
    member do
      post 'add_to_cart'
      get 'cart'
    end
  end
  
  resource :cart, only: :show

end
