module UsersHelper

  def user_gender(sex)
    t(".#{sex}")
  end

  def sex_attributes_for_select
    User.sexes.map do |sex, value|
      [I18n.t("activerecord.attributes.user.sexes.#{sex}"), sex]
    end
  end
end
