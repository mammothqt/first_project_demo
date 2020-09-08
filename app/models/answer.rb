class Answer < ApplicationRecord
	belongs_to :question

	validate :question_id, presence: true
	validate :content, presence: true, length: { maximum: 50 }
	validate :correct_answer, default: false
end
