class CreateLongShots < ActiveRecord::Migration
  def change
    create_table :long_shots do |t|
      t.attachment :image
      t.references :flood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
