class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
         :validatable, :confirmable, :recoverable, :omniauthable, omniauth_providers: [:facebook]

  has_many :user_results, dependent: :destroy

  validates :full_name, presence: true, length: { maximum: Settings.user.full_name.max_length }
  validates :admin, default: false
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  enum sex: { hidden: 0, male: 1, female: 2 }

  def self.attribute_export
    ExportCsv::ExportFormat::ATTRIBUTE_EXPORT_USER_CSV
  end

  def attribute_objects
    user_results.newest
  end

  def user_sex
    I18n.t("activerecord.attributes.user.sexes.#{self.sex}")
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Settings.user.password.default
      user.full_name = auth.info.name   # assuming the user model has a name
      user.user_name = auth.info.name # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
