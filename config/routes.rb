Rails.application.routes.draw do

  mount Notifications::Engine => "/notifications"
  root to: 'pages#index'
  devise_for :users, path: '', path_names: { sign_in: 'sign_in', sign_out: 'sign_out'}
  get '/updatepassword' => 'paswords#new'
  post '/updatepassword' => 'paswords#create'


  # resources :paswords

  # get '/users/sign_out' => 'devise/sessions#destroy'
  # get '/users/sign_up' => 'devise/registrations#new'
  # get '/users/sign_in' => 'devise/sessions#create'

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
