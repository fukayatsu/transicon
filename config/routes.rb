Rails.application.routes.draw do
  root to: 'pages#index'
  resources :icons,     only: [:index, :create]
  resources :sentences, only: [:index, :create]
end
