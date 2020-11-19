class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_results, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :name, presence: true, length: { maximum: Settings.test.name.max_length }
  validates :description, length: { maximum: Settings.test.description.max_length }

  def self.attribute_export
    ExportCsv::ExportFormat::ATTRIBUTE_EXPORT_TEST_CSV
  end

  def number_question
    questions.count
  end
end
