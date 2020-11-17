class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from(CanCan::AccessDenied) do |exception|
    redirect_to root_path, :alert => exception.message
  end

  rescue_from(ActiveRecord::RecordNotFound) do
    redirect_to root_path, :alert => t(".not_found")
  end

  protected
  def configure_permitted_parameters
    update_attrs = [:email, :age, :sex, :full_name]
    signup_attrs = [:email, :age, :full_name]
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
    devise_parameter_sanitizer.permit(:sign_up, keys: signup_attrs)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
  	{ locale: I18n.locale }
  end
end
