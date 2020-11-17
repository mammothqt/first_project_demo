module UsersHelper
  def user_gender sex
    t(".#{sex}")
  end
end
