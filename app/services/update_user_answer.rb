class UpdateUserAnswer
  def initialize user_answers
    @user_answers = user_answers
  end

  def perform
  	@user_answers.each do |user_answer|
  	  user_answer.update(is_correct: user_answer_correct?(user_answer))
  	end
  end

  private

  def user_answer_correct? user_answer
    user_answer.answer == user_answer.correct_answer(user_answer.question_correct_answer_id)
  end
end
