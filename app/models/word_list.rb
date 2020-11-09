class WordList < ApplicationRecord
  belongs_to :course

  validates :word, length: { maximum: 100 }, presence: true
end
