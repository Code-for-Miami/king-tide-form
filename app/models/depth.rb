class Depth < ActiveRecord::Base
  belongs_to :flood
  enum unit: {
    inches: 0,
    eights_of_an_inch: 1,
    centimeters: 2
  }
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :level, :unit, :image, presence: true
end
