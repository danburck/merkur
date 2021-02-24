Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
resources :trips, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bodies, only: [ :index, :show, :new, :create ] do
    resources :trips, only: [ :index,:new, :create ]
  end
end
