class CreateLifts < ActiveRecord::Migration[7.1]
  def change
    create_table :lifts do |t|
      t.string :driver_name
      t.date :date
      t.time :time
      t.string :start_location
      t.string :destination
      t.decimal :cost

      t.timestamps
    end
  end
end
