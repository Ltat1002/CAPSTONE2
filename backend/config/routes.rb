Rails.application.routes.draw do
  devise_for :users
  resources :vouchers
  resources :reviews
  resources :reports
  resources :users
  resources :repair_equipments
end
