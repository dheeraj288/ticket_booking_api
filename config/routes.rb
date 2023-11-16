Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  get '/member_details' => 'members#index'

    namespace :api do
      namespace :v1 do 
        resources :reservations do
          collection do
            get 'history', to: 'reservations#history'
            get 'upcoming', to: 'reservations#upcoming'
          end
        end
      end
    end
end