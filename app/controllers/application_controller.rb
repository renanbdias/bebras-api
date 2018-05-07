class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include RenderError

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :city, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :city, :avatar])
  end
end
