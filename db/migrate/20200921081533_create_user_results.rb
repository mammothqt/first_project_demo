class CreateUserResults < ActiveRecord::Migration[6.0]
  def change
    create_table :user_results do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :grade

      t.timestamps
    end

    add_index :user_results, :user_id
    add_index :user_results, :test_id
  end
end
