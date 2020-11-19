class UserResult < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :user_answers, dependent: :destroy

  delegate :number_question, :name, to: :test, prefix: :test
  delegate :full_name, to: :user, prefix: :user

  accepts_nested_attributes_for :user_answers

  before_save :default_grade

  enum status: { fail: 0, pass: 1 }

  def number_correct
    user_answers.count { |answer| answer.is_correct }
  end

  def self.attribute_export
    ExportCsv::ExportFormat::ATTRIBUTE_EXPORT_USER_RESULT_CSV
  end

  def default_grade
    self.grade ||= 0
  end

  def result_announcement
    I18n.t("activerecord.attributes.user_result.statuses.#{self.status}")
  end
end
