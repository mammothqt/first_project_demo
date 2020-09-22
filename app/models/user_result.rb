class UserResult < ApplicationRecord
	belongs_to :user
	belongs_to :test
	has_many :user_answers, dependent: :destroy

	accepts_nested_attributes_for :user_answers

	# validates  :grade, presence: true
end
