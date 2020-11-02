class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_results, dependent: :destroy

  validates :full_name, presence: true, length: { maximum: 50 }
  validates :admin, default: false
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
end
