class AddStatusToUserResults < ActiveRecord::Migration[6.0]
  def change
    add_column :user_results, :status, :boolean
  end
end
