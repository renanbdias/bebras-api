module Overrides
  class PasswordsController < DeviseTokenAuth::PasswordsController

    def update
      if current_api_user.reset_password_token == params["reset-token"]
        @resource.allow_password_change = true
      end

      super
    end

    def render_create_success
      render json: {
        message: I18n.t("devise_token_auth.passwords.sended", email: @email)
      }
    end

    def render_create_error
      render json: {
        message: I18n.t("devise_token_auth.passwords.sended", email: @email)
      }
      # render json: {
      #   errors: @errors,
      # }, status: @error_status
    end

    def render_update_success
      if @resource
        # clear_session @resource, @client_id
        respond_to do |format|
          format.html {
            redirect_to password_reset_success_url
          }
          format.json {
            render json: {
              success: true
            }, status: 200
          }
        end
      else
        respond_to do |format|
          format.html
          format.json {
            render json: {
              errors: ["Invalid login credentials"]
            }, status: 401
           }
        end
      end
    end

    def render_update_error
      if @resource
        respond_to do |format|
          format.html {
            flash[:errors] = @resource.errors.full_messages
            redirect_back(fallback_location: password_reset_url)
          }
          format.json {
            render json: {
              errors: @resource.errors.full_messages,
              debug: Rails.env.development? ? @resource.errors : nil
            }, status: 422
          }
        end
      else
        respond_to do |format|
          format.html
          format.json {
            render json: {
              errors: ["Invalid login credentials"]
            }, status: 401
           }
        end
      end
    end

    private
    def clear_session(resource, client_id)
      if resource and client_id and resource.tokens[client_id]
        resource.tokens.delete(client_id)
        resource.save!
      end
    end

    # private
    # def set_locale
    #   I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    # end
  end
end