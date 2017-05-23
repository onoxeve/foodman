Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, path: '/', only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :likes
    end
  end
  resources :foods, only: [:show, :new, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  #resources :likes, only: [:create, :destroy]
end
