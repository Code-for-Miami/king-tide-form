class RemoveDepthFromTidePredictions < ActiveRecord::Migration
  def change
    remove_column :tide_predictions, :depth, :integer
  end
end
