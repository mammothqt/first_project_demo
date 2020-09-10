class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    include SessionsHelper

  	protected

 	def configure_permitted_parameters
    sign_up_attrs = [:user_name, :email, :full_name, :password, :password_confirmation, :remember_me]
    update_attrs = [:user_name, :email, :full_name, :password, :password_confirmation, :age, :gender]
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
