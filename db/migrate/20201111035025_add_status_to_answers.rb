class AddStatusToAnswers < ActiveRecord::Migration[6.0]
  def change
  	add_column :answers, :status, :integer, default: 0, null: false
  end

  add_index :answers, :status
end
