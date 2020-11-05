class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_results, dependent: :destroy

  accepts_nested_attributes_for :questions

  validates :name, presence: true, length: { maximum: 150 }
  validates :description, length: { maximum: 1000 }

  def number_question_test
    questions.count
  end
end
