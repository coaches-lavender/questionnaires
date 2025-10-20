class CreateQuestionGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :question_groups do |t|
      t.belongs_to :questionnaire, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
