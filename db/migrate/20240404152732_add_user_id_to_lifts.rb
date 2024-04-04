class AddUserIdToLifts < ActiveRecord::Migration[7.1]
  def change
    add_column :lifts, :user_id, :integer
    add_index :lifts, :user_id
  end
end
