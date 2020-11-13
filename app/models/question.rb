class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates :content, length: { maximum: 150 }, presence: true
  validates :correct_answer_id, presence: true

  def correct_answer_of_question correct_answer_id
    answers[correct_answer_id]
  end
end
