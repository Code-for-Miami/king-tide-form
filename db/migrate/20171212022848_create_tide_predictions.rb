class CreateTidePredictions < ActiveRecord::Migration
  def change
    create_table :tide_predictions do |t|
      t.integer :station
      t.date :date
      t.datetime :time
      t.float :depth
      t.integer :highlow

      t.timestamps null: false
    end
  end
end
