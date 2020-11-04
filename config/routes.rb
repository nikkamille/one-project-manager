Rails.application.routes.draw do
  resources :projects do
    resources :tasks, only: [:index, :show]
  end

  resources :tasks

  resources :users do
    resources :tasks, only: [:index, :show, :new, :edit]
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'home', to: 'sessions#home'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
