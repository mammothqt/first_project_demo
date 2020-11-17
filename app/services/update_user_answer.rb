class UpdateUserAnswer

  def initialize(user_answers)
    @user_answers = user_answers
  end

  def perform
    user_answers.each do |answer|
      answer.update!(is_correct: correct?(answer))
    end
  end

  private

  attr_reader(:user_answers)

  def correct?(choice)
    choice.answer == choice.correct_answer
  end
end
