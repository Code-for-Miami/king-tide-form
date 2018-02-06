json.array! @predictions do |prediction|
    
    json.monthName Date::MONTHNAMES[prediction.month]
    json.monthData prediction.month_data

end