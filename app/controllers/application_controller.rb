class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  protected
  def configure_permitted_parameters
    update_attrs = [:email]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
  	{ locale: I18n.locale }
  end
end
