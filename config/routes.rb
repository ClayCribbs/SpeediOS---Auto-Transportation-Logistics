Rails.application.routes.draw do
  resources :vehicles
  resources :delivery_trucks

  root 'delivery_trucks#index'

  get 'trucks' => 'delivery_trucks#index'
  get 'vehicles' => 'vehicles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
