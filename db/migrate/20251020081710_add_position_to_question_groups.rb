class AddPositionToQuestionGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :question_groups, :position, :integer, null: false, default: 0
  end
end
