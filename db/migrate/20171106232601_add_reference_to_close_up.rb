class AddReferenceToCloseUp < ActiveRecord::Migration
  def change
    add_reference :close_ups, :flood, index: true, foreign_key: true
  end
end
