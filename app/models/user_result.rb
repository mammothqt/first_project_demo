class UserResult < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :user_answers, dependent: :destroy

  delegate :number_question, :name, to: :test, prefix: :test

  accepts_nested_attributes_for :user_answers

  def number_correct
    user_answers.count { |answer| answer.is_correct }
  end

  def grades
    @grade ||= 0
  end

  def self.attribute_export
    ExportCsv::RowFormat::ATTRIBUTE_EXPORT_USER_RESULT_CSV
  end
end
