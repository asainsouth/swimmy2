class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:fast_name,:last_name_kana,:fast_name_kana,:phone_number,:postal_code,:address])
  end
end
