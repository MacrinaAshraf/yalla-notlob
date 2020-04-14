Rails.application.routes.draw do

  root to: 'pages#index'
  devise_for :users, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out'}
  get '/updatepassword' => 'paswords#new'
  post '/updatepassword' => 'paswords#create'
  post 'orders/checkInvitedExistance', to: 'orders#checkInvitedExistance', :as => 'checkInvitedExistance'

  # resources :paswords

  # get '/users/sign_out' => 'devise/sessions#destroy'
  # get '/users/sign_up' => 'devise/registrations#new'
  # get '/users/sign_in' => 'devise/sessions#create'

  # match "*path", to: "pages#errorPage", via: :all



  resources :friends
  resources :groups
  resources :orders do
    # resource :order_details
    resources :order_details, only: [:create, :destroy]
  end


  # end
  get 'status/:id' => 'orders#change_status', :as => 'status'
  # resources  :users do
  #   resources :posts, only: [:index]
  #  end

end
