class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :score, null: false

      t.timestamps
    end
  end
end
