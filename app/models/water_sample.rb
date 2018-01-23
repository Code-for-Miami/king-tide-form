class WaterSample < ActiveRecord::Base
    belongs_to :flood
    has_attached_file :image
    validates :image, presence: true, if: lambda{ |model| model.bottle_number.present? }
end
