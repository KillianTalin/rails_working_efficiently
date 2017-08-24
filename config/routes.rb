Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  # resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
  get '/tasks', to: 'tasks#index_direct'
end
