class Depth < ActiveRecord::Base
  belongs_to :flood
  enum unit {
    inches: 0,
    eights_of_an_inch: 1,
    centimeters: 2
  }
end
