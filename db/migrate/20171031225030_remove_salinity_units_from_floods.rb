class RemoveSalinityUnitsFromFloods < ActiveRecord::Migration
  def change
    remove_column :floods, :salinity_units, :string
  end
end
