class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_results, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  CSV_ATTRIBUTES = %w(name description questions).freeze

  def number_question_test
    questions.count
  end
end
