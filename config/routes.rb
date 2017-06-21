Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :followeings
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :recipes do
    resources :ingredients, shallow: true
    resources :instractions, shallow: true
  end
end