class UserResult < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :user_answers, dependent: :destroy

  accepts_nested_attributes_for :user_answers

  def number_correct_answer
    user_answers.count { |answer| answer.is_correct }
  end

  def test_name
  	test.name
  end

  def grades
    @grade ||= 0
  end
end
