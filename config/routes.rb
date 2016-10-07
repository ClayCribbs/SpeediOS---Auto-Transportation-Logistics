Rails.application.routes.draw do
  devise_for :users
  resources :vehicles
  resources :delivery_trucks
  get 'main' => 'welcome#about'

  get 'delivery_trucks_index' => 'delivery_trucks#index'


  root 'welcome#index'

  get 'trucks' => 'delivery_trucks#index'
  get 'vehicles' => 'vehicles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
