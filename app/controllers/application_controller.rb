class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs + [:first_name, :last_name, :birth_date, :bio])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [)
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :remember_me])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :about, :email, :password, :current_password, :remember_me])
  #end

end
