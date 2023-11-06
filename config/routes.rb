Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  get '/member_details' => 'members#index'

  namespace :api do
    namespace :v1 do 
      resources :reservations do
        collection do
          get 'history'
          get 'upcoming'
        end
      end
    end
  end
end