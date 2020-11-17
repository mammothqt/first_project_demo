class FixUserAnswerColumn < ActiveRecord::Migration[6.0]
  def change
  	rename_column :user_answers, :user_answer, :answer_id
  end
end
