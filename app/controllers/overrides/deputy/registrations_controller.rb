module Overrides
  class Deputy::RegistrationsController < DeviseTokenAuth::RegistrationsController

    def edit
      if current_api_deputy
        render json: current_api_deputy, status: 200
      else
        render json: {
            errors: ["Invalid login credentials"]
        }, status: 401
      end
    end

    def update
      if current_api_deputy
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
        serviceResponse = CreateSchoolService.call(school_params: params[:school])
        unless serviceResponse.success?
          raise "School is invalid #{serviceResponse.errors}"
        end

        school = serviceResponse.result

        # https://www.reddit.com/r/rails/comments/39hywm/help_question_about_model_namespacing_with_the/
        # The '::' references the model, not the current module (I think...)
        deputy = ::Deputy.new(provider: "email",
          uid: params[:email],
          email: params[:email],
          password: params[:password],
          name: params[:name],
          phone: params[:phone],
          avatar: params[:avatar],
          school: school)

        if deputy.valid?
          deputy.save

          sign_in(:deputy, deputy)

          auth_headers = deputy.create_new_auth_token
          response.headers.merge!(auth_headers)

          render json: deputy, status: :ok
        else
          raise deputy.errors.full_messages.join(", ")
        end

        # super
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