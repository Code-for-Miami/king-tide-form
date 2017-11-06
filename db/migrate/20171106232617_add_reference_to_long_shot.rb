class AddReferenceToLongShot < ActiveRecord::Migration
  def change
    add_reference :long_shots, :flood, index: true, foreign_key: true
  end
end
