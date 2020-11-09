module UsersHelper
  def user_gender gender
  	return if gender.nil?
  	gender ? t(".male") : t(".female")
  end
end
