Rails.application.routes.draw do
  root to: 'pages#index'
  get :edit, to: 'pages#edit'
  resources :icons,     only: [:index, :create]
  resources :sentences, only: [:index, :create] do
    collection do
      post :search
    end
  end
end
