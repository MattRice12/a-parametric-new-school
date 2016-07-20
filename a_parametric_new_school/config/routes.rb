Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#sign_in', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  post 'sign_out', to: 'sessions#sign_out', as: 'sign_out'
  get 'sign_out', to: 'sessions#destroy'

  resources :users
  resources :students
  resources :teachers
  resources :schools

  root 'schools#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
