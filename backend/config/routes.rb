Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :vouchers
      resources :reviews
      resources :reports
      resources :users
      resources :repair_equipments

      post 'auth/register', to: 'users#register'
      post 'auth/login', to: 'users#login'

      put 'edit_profile', to: 'users#edit_profile'
      get 'profile', to: 'users#profile'

      put 'become_partner', to: 'users#become_partner'

      namespace :engineer do
      end

      namespace :admin do
      end
    end
  end
end
