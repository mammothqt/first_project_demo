class CreateUserAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_answers do |t|
      t.integer :user_result_id
      t.boolean :is_correct
      t.integer :question_id
      t.integer :user_answer

      t.timestamps
    end
  end
end
