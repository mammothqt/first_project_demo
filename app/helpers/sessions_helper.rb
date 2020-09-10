module SessionsHelper

	def is_admin?
		current_user.admin?
	end

	def is_signed_in?
		!current_user.signed_in?
	end
end
