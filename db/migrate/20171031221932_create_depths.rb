class CreateDepths < ActiveRecord::Migration
  def change
    create_table :depths do |t|
      t.float :level
      t.attachment :image
      t.belongs_to :flood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
