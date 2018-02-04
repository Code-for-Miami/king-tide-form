class AddYearToTidePredictions < ActiveRecord::Migration
  def change
    add_column :tide_predictions, :year, :integer
  end
end
