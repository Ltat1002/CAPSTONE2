Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :vouchers
      resources :reviews, only: :create
      resources :reports
      resources :repair_equipments, only: %i[index show]

      post 'auth/register', to: 'users#register'
      post 'auth/login', to: 'users#login'
      put 'edit_profile', to: 'users#edit_profile'
      get 'profile', to: 'users#profile'
      put 'become_partner', to: 'users#become_partner'
      get 'search', to: 'reports#search'
      get 'all_engineer', to: 'users#all_engineer'
      post 'show_all_report', to: 'reports#show_all_report'
      put 'confirmed_offer', to: 'reports#confirmed_offer'
      put 'cancel_report', to: 'reports#cancel_report'

      namespace :engineer do
        resources :reports
        put 'receive', to: 'reports#receive_report'
        put 'offer', to: 'reports#offer_price'
        put 'submit', to: 'reports#submit_report'
        get 'receive_history', to: 'reports#receive_history'
        get 'receive_history/:id', to: 'reports#receive_history_details'
      end

      namespace :admin do
        resources :users, only: %i[index show]
        resources :reports, only: %i[index show]
        get 'show_engineer', to: 'users#show_engineer'
        put 'accept_cv', to: 'users#accept_cv'
        put 'approve_cv', to: 'users#approve_cv'
        put 'deny_cv', to: 'users#deny_cv'
        put 'activate_user', to: 'users#activate_user'
        put 'deactivate_user', to: 'users#deactivate_user'
        put 'edit_user/:id', to: 'users#edit_user'
        resources :repair_equipments, except: :destroy
        resources :reviews, only: %i[index show destroy]
      end
    end
  end
end
