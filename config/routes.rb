Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :memberships, only: [:create, :destroy]
      resources :messages, only: [:create]
      resources :chatrooms, only: [:create, :show]
      resources :users, only: [:index]

      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/re_auth', to: 'auth#re_auth'

      mount ActionCable.server => '/cable'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
