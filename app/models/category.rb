class Category < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :word_lists, through: :courses

  validates :name, length: { maximum: Settings.category.name.max_length }, presence: true
  validates :description, length: { maximum: Settings.category.description.max_length }

  def self.attribute_export
    ExportCsv::ExportFormat::ATTRIBUTE_EXPORT_CATEGORY_CSV
  end

  def attribute_objects
  	courses
  end
end
