Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :vouchers
      resources :reviews
      resources :reports
      resources :users
      resources :repair_equipments

      post 'auth/register' , to: 'users#create'
      post 'auth/login' , to: 'users#login'
    end
  end
end
