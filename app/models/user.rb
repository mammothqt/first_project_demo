class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  has_many :user_results, dependent: :destroy

    validates :full_name, presence: true, length: { maximum: 50 }
    validates :admin, default: false
    validates :user_name, presence: true, uniqueness: { case_sensitive: false }
    validate :validate_username

  attr_writer :login

  def login
    @login || self.username
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(user_name) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username)
      where(conditions.to_h).first
    end
  end

  def validate_username
  	if User.where(email: user_name).exists?
    	errors.add(:user_name, :invalid)
  	end
  end
end
