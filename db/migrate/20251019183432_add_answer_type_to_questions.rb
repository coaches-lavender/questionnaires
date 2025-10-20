class AddAnswerTypeToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :answer_type, :string, default: "scored", null: false
  end
end
