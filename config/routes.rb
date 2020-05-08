Rails.application.routes.draw do
  resources :customs
  resources :users, only: [:create, :index, :update]
  resources :auth, only: [:create]
  resources :items, only: [:index, :create, :destroy]
  resources :sales, only: [:create, :destroy]
  resources :wishes, only: [:create, :destroy]
  resources :requests, only: [:create, :update]

  get '/login', to: 'users#profile'
  get '/user/:username', to: 'users#visit'
  get '/users/with/:item_name', to: 'users#item_search'
  get '/users/named/:username', to: 'users#name_search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
