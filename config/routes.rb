Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'Deputy', at: 'auth', controllers: {
        registrations: 'overrides/deputy/registrations',
        sessions: 'overrides/sessions',
        passwords: 'overrides/passwords'
      }

      mount_devise_token_auth_for 'Competitor', at: 'competitor_auth', controllers: {
        registrations: 'overrides/registrations',
        sessions: 'overrides/sessions',
        passwords: 'overrides/passwords'
      }

      resources :challenges, only: [:index, :create, :update, :destroy] do
        member do
          post :start_challenge
          post :end_challenge
          get :competitors
          post :add_competitor
          post :remove_competitor
        end
        collection do
          get 'current_server_time', to: 'challenges#current_server_time'
          get :firebase_token
          get :get_challenge
        end
      end

      resources :questions, only: [:index] do
        member do
          post :answer
        end
        collection do
          post :answer_questions
        end
      end
    end
	end
end