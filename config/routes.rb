Rails.application.routes.draw do
  resources :projects
  root "students#index"
  resources :students
  resources :courses
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
