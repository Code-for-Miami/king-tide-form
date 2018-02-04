class TidePredictionsController < ApplicationController
  def index
    today = Time.now

    @predictions = TidePrediction.where(year:today.year, month: today.month, station: 8725411)
  end

  
end
