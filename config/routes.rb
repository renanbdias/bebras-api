Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'Deputy', at: 'auth', controllers: {
        registrations: 'overrides/registrations',
        sessions: 'overrides/sessions',
        passwords: 'overrides/passwords'
      }

      mount_devise_token_auth_for 'Competitor', at: 'competitor_auth', controllers: {
        registrations: 'overrides/registrations',
        sessions: 'overrides/sessions',
        passwords: 'overrides/passwords'
      }

      resources :challenges, only: [:index, :create] do
        member do
          post :start_challenge
          post :end_challenge
        end
        collection do
          get 'current_server_time', to: 'challenges#current_server_time'
        end
      end

      resources :questions, only: [:index]
    end
	end
end