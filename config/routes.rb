Rails.application.routes.draw do
  devise_for :travellers
  root to: 'pages#home'
  resources :planets, only: [:show]
end
