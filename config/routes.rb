Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/logout' => 'users#logout', as: :logout

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users do 
    resources :posts, only: [:show, :index, :new, :create, :edit, :update]
  end

  resources :posts do
    resources :comments, only: [:show, :index, :new, :edit, :destroy]
  end

  resources :comments
  resources :posts

  resources :items do 
    resources :cart_items
  end
  resources :carts
end
