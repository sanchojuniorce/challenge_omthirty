Rails.application.routes.draw do
  root to: "municipes#index"
  resources :enderecos
  resources :municipes, :except => [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
