Rails.application.routes.draw do
  resources :projects

  resources :tasks

  resources :users do
    resources :tasks, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
