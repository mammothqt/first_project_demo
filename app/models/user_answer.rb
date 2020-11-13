class UserAnswer < ApplicationRecord
  belongs_to :user_result
  belongs_to :answer, foreign_key: :user_answer

  delegate :question, to: :answer, allow_nil: true
  delegate :content, to: :answer, prefix: :answer

  def question_content
  	question.content
  end

  def question_correct_answer_id
    question.correct_answer_id
  end

  def correct_answer correct_answer_id
    question.correct_answer_of_question(correct_answer_id)
  end
end
