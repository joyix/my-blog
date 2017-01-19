Rails.application.routes.draw do

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :articles, only: [:create, :edit, :update, :show, :destroy] do
    member do
      post :like
    end
  end

  resources :articles, only: [:create, :edit, :update, :show, :destroy] do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]
end
