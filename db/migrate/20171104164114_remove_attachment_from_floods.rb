class RemoveAttachmentFromFloods < ActiveRecord::Migration
  def change
    remove_attachment :floods, :attachment
  end
end
