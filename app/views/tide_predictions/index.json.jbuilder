json.predictions @predictions do |prediction|
    json.date prediction.time.to_date
    json.time prediction.time.to_s(:time)
    json.depth prediction.depth
    json.high_low prediction.highlow
end