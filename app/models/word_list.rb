class WordList < ApplicationRecord
	belongs_to :course

	validates :course_id, presence: true
	validates :content, length: { maximum: 50 }, presence: true
end
