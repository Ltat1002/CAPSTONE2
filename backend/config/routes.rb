Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :vouchers
      resources :reviews
      resources :reports
      resources :repair_equipments

      post 'auth/register', to: 'users#register'
      post 'auth/login', to: 'users#login'

      put 'edit_profile', to: 'users#edit_profile'
      get 'profile', to: 'users#profile'

      put 'become_partner', to: 'users#become_partner'

      get 'search', to: 'reports#search'

      namespace :engineer do
        get 'index', to: 'reports#index'
        put 'receive', to: 'reports#receive_report'
        put 'offer', to: 'reports#offer_price'
        put 'submit', to: 'reports#submit_report'
      end

      namespace :admin do
        resources :users, only: :index
      end
    end
  end
end
