class Test < ApplicationRecord
	has_many :questions, dependent: :destroy

	validates :name, presence: true
	validates :description, length: { maximum: 150 }
end
