Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'custom_sessions' }

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :addresses

end
