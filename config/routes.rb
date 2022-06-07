Rails.application.routes.draw do
  devise_for :teachers
  resources :projects
  root "pages#index"
  get 'students/about', to: 'students#about', as: 'patient'
  resources :students do
    member do
      get :profile
    end

    collection do
      get :active
    end
  end

  #namespace :admin do
  #resources :students_fees, :results
  #end
  #scope module: :admin do
  #  resources :students_fees
  #end
  #scope module:'admin' do
  #  resources :articles, :comments
  #end
  #resources :articles,:comments, module: 'admin'
  scope '/admin' do
    resources :articles, :comments
  end
  resources :courses
  #get 'about/' => "students#about"
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
