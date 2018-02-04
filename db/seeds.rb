# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')




predictions = []
puts "begun at", Time.now

json = File.read('db/tidesByMonth.json')
parsedJSON = JSON.parse(json)

parsedJSON.each do |station, years|
    years.each do |year, months|
        months.each_with_index do |month_data, month|
            predictions.push({station: station, year: year, month: month+1, month_data: month_data})
        end
    end
    puts "Parsed station #{station}"
end



puts "finished loading at", Time.now
TidePrediction.bulk_insert values: predictions
puts "submitted at", Time.now
