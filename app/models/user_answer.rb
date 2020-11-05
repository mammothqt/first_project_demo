class UserAnswer < ApplicationRecord
  belongs_to :user_result
  belongs_to :answer, foreign_key: :user_answer

  delegate :question, :to => :answer, :allow_nil => false

  def question_correct_answer_id
    question.correct_answer_id
  end

  def question_content
  	question.content
  end

  def answer_content
    answer.content
  end

  def correct_answer correct_answer_id
    question.correct_answer_of_question correct_answer_id
  end

  def update_is_correct params
    self.update is_correct: params
  end
end
