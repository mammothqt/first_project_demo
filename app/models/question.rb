class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  validates :content, length: { maximum: Settings.question.content.max_length }, presence: true
  validates :correct_answer_id, presence: true
end
