class UserAnswer < ApplicationRecord
  belongs_to :user_result
  belongs_to :answer

  delegate :question, to: :answer
  delegate :content, to: :answer, prefix: :answer

  validates :is_correct, default: false

  def question_content
  	question.content
  end

  def question_correct_answer_id
    question.correct_answer_id
  end

  def correct_answer
    question.answers[self.question_correct_answer_id]
  end
end
