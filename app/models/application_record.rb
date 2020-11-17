class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :newest, -> { order(created_at: :desc) }
end
