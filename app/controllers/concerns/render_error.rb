module RenderError
  def render_error error
    if error.kind_of? ActiveModel::Errors
      render_active_model_error error
    elsif error.kind_of? String
      render_string_error error
    elsif error.kind_of? Exception
        render_exception_error error
    else
      render json: {
        errors: [error.inspect],
        # debug: Rails.env.development? ? error.inspect : nil
      }, status: :unprocessable_entity
    end
  end

  private
    def render_string_error error_string
      render json: {
        errors: [error_string],
        # debug: Rails.env.development? ? error_string.inspect : nil
      }, status: :unprocessable_entity
    end

    def render_active_model_error errors
      render json: {
        errors: errors.full_messages,
        fields: errors,
        # debug: Rails.env.development? ? errors.inspect : nil
      }, status: :unprocessable_entity
    end

    def render_exception_error exception
      render json: {
        errors: [exception.message],
        # debug: Rails.env.development? ? exception.inspect : nil
      }, status: :unprocessable_entity
    end
end