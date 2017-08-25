Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :clients
  get '/select_tasks', to: 'pages#select_tasks'
  get '/list_tasks', to: 'pages#list_tasks'
  get '/tasks', to: 'tasks#index_direct'
end
