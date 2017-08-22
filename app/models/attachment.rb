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
   has_attached_file :upload,
  					:storage => :s3,
  					:s3_credentials => Proc.new{|a| a.instance.s3_credentials },
  					:url => ":s3_domain_url",
  					:path => ":attachment/:filename",
  					:s3_host_name => "s3.amazonaws.com"
  def s3_credentials
    {:bucket => ENV["AWS_S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"], :s3_region => ENV["AWS_DEFAULT_REGION"]}
  end
  validates_attachment_content_type :upload, :content_type =>['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'video/mp4', 'video/avi', 'video/mov']

end
