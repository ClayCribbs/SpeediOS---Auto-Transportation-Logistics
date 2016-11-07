Rails.application.routes.draw do

  get 'bill_of_lading/address'

  get 'bill_of_lading/contract'

  get 'bill_of_lading/phone_number'

  resources :companies
  resources :invoices
  resources :drivers
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :vehicles
  resources :delivery_trucks

  get 'splash' => 'welcome#splash'

  post 'add_to_cart' => 'cart#add_to_cart'

  get 'consolepage' => 'welcome#consolepage'

  get 'view_order' => 'cart#view_order'

  get 'checkout' => 'cart#checkout'

  get 'invoices' => 'invoice#index'

  get 'companies' => 'company#index'
  
  root 'welcome#index'

  get 'contacts' => 'welcome#about'

  get 'dashboard' => 'welcome#index'

  get 'main' => 'welcome#about'

  get 'delivery_trucks_index' => 'delivery_trucks#index'

  get 'trucks' => 'delivery_trucks#index'

  get 'vehicles' => 'vehicles#index'

  get 'drivers' => 'drivers#index'
  
  get 'bol' => 'invoices#_bol'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
