class AddUnitToDepth < ActiveRecord::Migration
  def change
    add_column :depths, :unit, :integer
  end
end
