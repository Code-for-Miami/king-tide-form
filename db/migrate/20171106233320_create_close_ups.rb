class CreateCloseUps < ActiveRecord::Migration
  def change
    create_table :close_ups do |t|
      t.attachment :image
      t.references :flood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
