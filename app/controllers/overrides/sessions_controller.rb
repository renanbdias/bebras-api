module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController

    def render_create_success
      if @resource
        render json: @resource
      else
        render json: {
          errors: ["Invalid login credentials"]
        }, status: 401
      end
    end

    def render_create_error
      render json: {
        errors: @resource.errors.full_messages,
        debug: Rails.env.development? ? @resource.errors : nil
      }, status: 422
    end

  end
end