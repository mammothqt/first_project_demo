class AddColumnToWordlists < ActiveRecord::Migration[6.0]
  def change
  	add_column :word_lists, :category_id, :integer
  end
end
