class Category < ApplicationRecord
	validates :name, presence: true

	has_many :courses, dependent: :destroy
	has_many :word_lists, through: :courses
end
