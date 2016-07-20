Rails.application.routes.draw do
  resources :users
  resources :students
  resources :teachers
  resources :schools

  root 'schools#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
