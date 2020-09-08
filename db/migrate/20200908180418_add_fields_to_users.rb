class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :full_name, :string
  	add_column :users, :age, :integer
  	add_column :users, :gender, :boolean
  	add_column :users, :admin, :boolean, default: false
  end
end
