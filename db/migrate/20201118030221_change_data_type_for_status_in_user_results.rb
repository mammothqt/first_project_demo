class ChangeDataTypeForStatusInUserResults < ActiveRecord::Migration[6.0]
  def change
  	change_column(:user_results, :status, :integer)
  end
end
