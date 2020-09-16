class Course < ApplicationRecord
	belongs_to :category
	has_many :word_lists, dependent: :destroy

	validates :name, length: { maximum: 50 }, presence: true
	validates :category_id, presence: true
end
