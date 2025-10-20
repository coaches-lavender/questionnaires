class AddLast4DigitsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :last_4_digits, :string, null: false
  end
end
