class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.belongs_to :questionnaire, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
