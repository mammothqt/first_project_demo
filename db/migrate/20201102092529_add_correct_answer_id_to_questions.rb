class AddCorrectAnswerIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :correct_answer_id, :integer
  end
end
