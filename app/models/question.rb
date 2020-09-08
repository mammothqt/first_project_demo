class Question < ApplicationRecord
	belongs_to :test
	has_many :answers

	validates :test_id, presence: true
	validates :content, length: { maximum: 150 }, presence: true
end
