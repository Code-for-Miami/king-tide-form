class AddMonthToTidePredictions < ActiveRecord::Migration
  def change
    add_column :tide_predictions, :month, :integer
  end
end
