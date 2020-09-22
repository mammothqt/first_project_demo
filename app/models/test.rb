class Test < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :user_results, dependent: :destroy

	accepts_nested_attributes_for :questions

	validates :name, presence: true
	validates :description, length: { maximum: 150 }
end
