# == Schema Information
#
# Table name: attachments
#
#  id                  :integer          not null, primary key
#  flood_id            :integer
#  upload_file_name    :string(255)
#  upload_content_type :string(255)
#  upload_file_size    :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Attachment < ActiveRecord::Base
  belongs_to :flood
  has_attached_file :upload
  validates_attachment_content_type :upload, :content_type =>['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'video/mp4', 'video/avi', 'video/mov']

end
