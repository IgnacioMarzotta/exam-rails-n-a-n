Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tasks
  root to: 'todos#index'
  get 'todos/:todo_id/complete', to: 'todos#complete', as: 'complete_todo'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
