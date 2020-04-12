Rails.application.routes.draw do
  #resources :users
  
  # root to: 'devise#index'
 
  devise_for :users
   
    root to: 'pages#index'

    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_up' => 'devise/registrations#new'
    get '/users/sign_in' => 'devise/sessions#create'

    # match "*path", to: "pages#errorPage", via: :all
    resources :friends
    resources :groups
    resources :orders
  # end
    get 'status/:id' => 'orders#change_status', :as => 'status'
  # resources  :users do
  #   resources :posts, only: [:index]
  #  end

end
