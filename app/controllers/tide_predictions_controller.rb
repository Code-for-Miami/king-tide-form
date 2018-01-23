class TidePredictionsController < ApplicationController
  def index
    
    from_date = Time.now.beginning_of_day
    to_date = 3.months.from_now.end_of_day
    @predictions = TidePrediction.where(:time => from_date..to_date, station: params[:station])
  end

  
end
