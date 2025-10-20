class CreateQuestionnaires < ActiveRecord::Migration[8.0]
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
