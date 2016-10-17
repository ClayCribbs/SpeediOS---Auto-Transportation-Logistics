Rails.application.routes.draw do
  resources :drivers
  devise_for :users
  resources :vehicles
  resources :delivery_trucks

  root 'welcome#index'

  get 'contacts' => 'welcome#about'

  get 'dashboard' => 'welcome#index'

  get 'main' => 'welcome#about'

  get 'delivery_trucks_index' => 'delivery_trucks#index'

  get 'trucks' => 'delivery_trucks#index'

  get 'vehicles' => 'vehicles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
