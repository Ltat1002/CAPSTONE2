Rails.application.routes.draw do
  resources :reviews
  resources :reports
  resources :users
  resources :repair_equipments
  resources :wards
  resources :districts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
