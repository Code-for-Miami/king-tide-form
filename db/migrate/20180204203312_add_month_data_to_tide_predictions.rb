class AddMonthDataToTidePredictions < ActiveRecord::Migration
  def change
    add_column :tide_predictions, :month_data, :text
  end
end
