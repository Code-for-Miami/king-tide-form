class Flood < ActiveRecord::Base
  require 'csv'
  has_many :attachments
  #nested models (data that requires an attached image)
  has_one :salinity, :dependent => :destroy
  has_one :depth, :dependent => :destroy
  has_one :water_sample, :dependent => :destroy
  has_one :close_up, :dependent => :destroy
  has_one :long_shot, :dependent => :destroy

  #nested model for generic attachments (images and video)
  accepts_nested_attributes_for :attachments, :salinity, :depth,  allow_destroy: true
  
  validates_formatting_of :email, using: :email
  store :location, coder: JSON

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Flood.create!(row.to_h)
    end
  end
end