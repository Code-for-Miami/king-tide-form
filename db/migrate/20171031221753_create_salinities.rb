class CreateSalinities < ActiveRecord::Migration
  def change
    create_table :salinities do |t|
      t.float :level
      t.attachment :image
      t.belongs_to :flood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
