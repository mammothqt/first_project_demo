class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :user_results, dependent: :destroy

  validates :full_name, presence: true, length: { maximum: Settings.user.full_name.max_length }
  validates :admin, default: false
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  enum sex: { hidden: 0, male: 1, female: 2 }

  def self.attribute_export
    ExportCsv::ExportFormat::ATTRIBUTE_EXPORT_USER_CSV
  end

  def attribute_objects
    user_results
  end

  def user_sex
    I18n.t("activerecord.attributes.user.sexes.#{self.sex}")
  end
end
