class WordList < ApplicationRecord
  belongs_to :course

  validates :word, length: { maximum: Settings.word_list.word.max_length }, presence: true
end
