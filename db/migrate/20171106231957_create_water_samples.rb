class CreateWaterSamples < ActiveRecord::Migration
  def change
    create_table :water_samples do |t|
      t.integer :bottle_number
      t.attachment :image

      t.timestamps null: false
    end
  end
end
