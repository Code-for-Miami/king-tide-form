class RemoveHighlowFromTidePredictions < ActiveRecord::Migration
  def change
    remove_column :tide_predictions, :highlow, :integer
  end
end
