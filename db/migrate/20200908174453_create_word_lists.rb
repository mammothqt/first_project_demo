class CreateWordLists < ActiveRecord::Migration[6.0]
  def change
    create_table :word_lists do |t|
      t.integer :course_id
      t.string :word

      t.timestamps
    end
  end
end
