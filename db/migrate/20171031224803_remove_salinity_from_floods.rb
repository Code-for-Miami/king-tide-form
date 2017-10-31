class RemoveSalinityFromFloods < ActiveRecord::Migration
  def change
    remove_column :floods, :salinity, :decimal
  end
end
