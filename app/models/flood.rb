class Flood < ActiveRecord::Base
  require 'csv'
  has_many :attachments
  has_one :salinity, :dependent => :destroy
  has_one :depth, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :salinity, :depth,  allow_destroy: true
  validates_formatting_of :email, using: :email
  store :location, coder: JSON

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Flood.create!(row.to_h)
    end
  end
end