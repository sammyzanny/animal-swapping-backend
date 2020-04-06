Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  resources :auth, only: [:create]
  resources :items, only: [:index, :create]
  get '/login', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
