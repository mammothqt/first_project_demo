class Answer < ApplicationRecord
	belongs_to :question

	# validates :question_id, presence: true
	validates :content, presence: true, length: { maximum: 50 }
	validates :correct_answer, default: false
end
