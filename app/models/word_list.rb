class WordList < ApplicationRecord
	belongs_to :course

	validates :course_id, presence: true
	validates :word, length: { maximum: 50 }, presence: true
end
