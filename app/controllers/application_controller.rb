class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    case resource
    when Teacher
      admin_users_path
    when User
    user_contact_books_path(current_user.id)
    end
  end

  def set_search
    @search = ContactBook.ransack(params[:q])
    @contact_books = @search.result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:fast_name,:last_name_kana,:fast_name_kana,:phone_number,:postal_code,:address])
  end
end
