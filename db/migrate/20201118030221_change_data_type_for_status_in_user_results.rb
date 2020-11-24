class ChangeDataTypeForStatusInUserResults < ActiveRecord::Migration[6.0]
  def change
  	change_column :user_results, :status, :integer, using: 'status::integer'
  end
end
