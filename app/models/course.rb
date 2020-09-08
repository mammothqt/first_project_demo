class Course < ApplicationRecord
	belongs_to :category

	validates :name, length: { maximum: 50 }, presence: true
	validates :category_id, presence: true
end
