Rails.application.routes.draw do
  get 'faqs/index'
  get 'about/index'
  resources :products
  devise_for :users

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :addresses

end
