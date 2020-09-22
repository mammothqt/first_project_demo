module UserResultsHelper
	def right_answer(question)
	  question.answers.find_by_correct_answer true
	end

	def is_correct_answer?(user_answer, correct_answer)
		user_answer == correct_answer
	end
end
