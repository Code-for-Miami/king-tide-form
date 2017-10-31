class RemoveWaterDepthUnitsFromFloods < ActiveRecord::Migration
  def change
    remove_column :floods, :water_depth_units, :string
  end
end
