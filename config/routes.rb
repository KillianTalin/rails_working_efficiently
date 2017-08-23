Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks, only: [:index]
  end
resources :tasks, only: [:show, :new, :update, :destroy]
  # projects/1/tasks tasks#index
  # projects/2/tasks tasks#index
  # # tasks tasks#index_direct

end
