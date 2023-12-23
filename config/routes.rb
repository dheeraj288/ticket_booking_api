Rails.application.routes.draw do
  get 'carts/create'
  get 'carts/destroy'
  get 'food_items/index'
  get 'food_items/show'
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

    resources :categories
     resources :food_items, only: [:index, :show]
      resources :carts, only: [:index, :create, :destroy]
end