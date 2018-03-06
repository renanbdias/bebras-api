Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'Deputy', at: 'auth', controllers: {
        registrations: 'overrides/registrations'
      }
    end
	end
end