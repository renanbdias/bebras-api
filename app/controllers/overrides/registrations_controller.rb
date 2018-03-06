module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def edit
      if current_api_user
        render json: current_api_user, status: 200
      else
        render json: {
            errors: ["Invalid login credentials"]
        }, status: 401
      end
    end

    def update
      if current_api_user
        begin
          super
        rescue Exception => e
          render json: {
              errors: [e.message],
              debug: Rails.env.development? ? e.inspect : nil
          }, status: 422
        end
      else
        render json: {
            errors: ["Invalid login credentials"]
        }, status: 401
      end
    end

    def create
      begin
        super
      rescue Exception => e
        render json: {
            errors: [e.message],
            debug: Rails.env.development? ? e.inspect : nil
        }, status: 422
      end
    end

    def render_create_success
      if @resource
        render json: @resource, status: 201
      else
        render json: {
          errors: ["Invalid login credentials"]
        }, status: 401
      end
    end

    def render_update_success
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

    def render_update_error
      render json: {
        errors: [@resource.errors.full_messages],
        debug: Rails.env.development? ? @resource.errors : nil
      }, status: 422
    end
  end
end