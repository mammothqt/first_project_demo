class UserAnswerDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def right_answer
    user_answer.is_correct ? user_answer.answer :
      user_answer.correct_answer(user_answer.question_correct_answer_id)
  end

  def user_answer_correct?
    object.question_correct_answer_id == object.user_answer
  end
end
