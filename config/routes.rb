Rails.application.routes.draw do
  devise_for :travellers
  root to: 'pages#home'
  resources :bodies, only: [:show]
end
