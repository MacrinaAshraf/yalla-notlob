Rails.application.routes.draw do
  #resources :users
  resources :groups
  resources :friends
  resources :orders
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
