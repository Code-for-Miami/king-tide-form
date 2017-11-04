class Salinity < ActiveRecord::Base
  belongs_to :flood
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true, if: lambda{ |model| model.level.present? }
end
