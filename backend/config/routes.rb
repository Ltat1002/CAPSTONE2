Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
=======
  resources :vouchers
>>>>>>> ca02fe0 (modify db user, report and add db vouchers)
  resources :reviews
  resources :reports
  resources :users
  resources :repair_equipments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
