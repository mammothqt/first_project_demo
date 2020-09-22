class UserAnswer < ApplicationRecord
	belongs_to :user_result
	belongs_to :answer, foreign_key: :user_answer

	delegate :question, :to => :answer, :allow_nil => false
end
