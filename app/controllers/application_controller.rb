class ApplicationController < ActiveController::Base
  protect_form_forgery with: :exception, prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[name password password_confirmation remember_me]
    device_parameter_sanitizer.permit :sign_up, keys: added_attrs
    device_parameter_sanitizer.permit :account_update, keys: addded_attrs
  end
end

