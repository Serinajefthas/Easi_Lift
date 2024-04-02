class AddContactToLifts < ActiveRecord::Migration[7.1]
  def change
    add_column :lifts, :contact_number, :string
  end
end
