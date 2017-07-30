Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:new, :show, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end
  end
  
  resources :recipes do
    resources :ingredients, shallow: true
    resources :instractions, shallow: true
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end