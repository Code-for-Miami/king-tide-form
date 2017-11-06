class AddReferenceToWaterSample < ActiveRecord::Migration
  def change
    add_reference :water_samples, :flood, index: true, foreign_key: true
  end
end
