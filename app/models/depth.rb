class Depth < ActiveRecord::Base
  belongs_to :flood
  enum unit {
    inches: 0,
    1_8_inches: 1,
    centimeters: 2
  }
end
