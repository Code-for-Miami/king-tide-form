class CloseUp < ActiveRecord::Base
  belongs_to :flood
  has_attached_file :image  
end
