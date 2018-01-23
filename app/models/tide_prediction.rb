class TidePrediction < ActiveRecord::Base
    enum highlow: {
        H: 0,
        L: 1
      }
end
