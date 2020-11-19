class Course < ApplicationRecord
  belongs_to :category
  has_many :word_lists, dependent: :destroy

  validates :name, length: { maximum: Settings.course.name.max_length }, presence: true
  validates :description, length: { maximum: Settings.course.description.max_length }

  def self.attribute_export
    ExportCsv::ExportFormat::ATTRIBUTE_EXPORT_COURSE_CSV
  end
end
