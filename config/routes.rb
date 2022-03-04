Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', 
                                               sign_out: 'logout',
                                               password: 'secret',
                                               confirmation: 'verification',
                                               unlock: 'unblock', 
                                               registration: 'register',
                                               sign_up: 'cmon_let_me_in' }

  root 'home#index'
  get  'dashboard/index'
  get  'home/index'
  get  'home/menu'
  get  'home/view_cart_page'
  get  'checkout/checkout'
  get  'home/user_profile'
  
  post 'pincodes/check_pincode'
  post 'user_addresses/save_address'
  
  # devise_scope :user do
  # # using login path for registration
  # get 'registration/login' => 'registration#login', :as => :registration_login
  # get 'registration/register' => 'registration#register', :as => :registration_register
  # post 'registration/signin' => 'sessions#create', :as => :home_user_session
  # post 'registration/sign_up' => 'registration#create', :as => :registration
  # end
  
  resources :menu_categories
  resources :menus
  resources :report , only: [:index]
  resources :images, only: [:new, :create]
  resources :user_addresses, only: [:create, :destroy]
  resources :cart ,only: [:update ,:destroy]
  resources :payments ,only: [:new , :create, :show]
  resources :checkout ,only: [:create]
end
