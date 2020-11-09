class Course < ApplicationRecord
  belongs_to :category
  has_many :word_lists, dependent: :destroy

  validates :name, length: { maximum: 50 }, presence: true
  validates :description, length: { maximum: 500 }
end
