class RemoveTimeFromTidePredictions < ActiveRecord::Migration
  def change
    remove_column :tide_predictions, :time, :datetime
  end
end
