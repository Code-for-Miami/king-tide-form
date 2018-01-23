class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :stationID
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
