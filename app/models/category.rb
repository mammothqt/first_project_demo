class Category < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :word_lists, through: :courses

  validates :name, length: { maximum: 50 }, presence: true
  validates :description, length: { maximum: 500 }
end
