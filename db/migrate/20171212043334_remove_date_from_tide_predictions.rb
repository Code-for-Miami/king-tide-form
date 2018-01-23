class RemoveDateFromTidePredictions < ActiveRecord::Migration
  def change
    remove_column :tide_predictions, :date, :date
  end
end
