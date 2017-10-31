class RemoveWaterDepthFromFloods < ActiveRecord::Migration
  def change
    remove_column :floods, :water_depth, :decimal
  end
end
