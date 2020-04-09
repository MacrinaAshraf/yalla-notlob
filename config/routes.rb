Rails.application.routes.draw do
  #resources :users
  
  # root to: 'devise#index'
 
  devise_for :users
   
  devise_scope :users do
    root to: 'pages#index'
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :friends
    resources :groups
    resources :orders
  end
  # resources  :users do
  #   resources :posts, only: [:index]
  #  end
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

end
