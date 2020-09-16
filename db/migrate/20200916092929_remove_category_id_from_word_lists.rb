class RemoveCategoryIdFromWordLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :word_lists, :category_id, :integer
  end
end
