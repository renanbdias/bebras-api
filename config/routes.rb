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

      resources :exam, only: [:index, :new, :create]

    end
	end
end