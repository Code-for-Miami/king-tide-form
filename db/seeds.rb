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

CSV.foreach('db/allTides.csv', headers: true) do |row|
    predictions.push({station: row['STATION'], time: Time.parse("#{row['DATE']}T#{row['TIME']}"), depth: row['PRED_IN_FT'], highlow: row['HIGHLOW']})
end
puts "finished loading at", Time.now
TidePrediction.bulk_insert values: predictions
puts "submitted at", Time.now



=begin

json = File.read('db/allTides.json')
parsedJSON = JSON.parse(json)

parsedJSON.each do |station, days|
    days.each do |day, times|
        times.each do |time,data|
            TidePrediction.create!(station: station, time: Time.parse("#{day}T#{time}"), depth: data[0], highlow: data[1])
        end
    end
    puts "Parsed station #{station}"
end

currentStation = 0
batch = []

CSV.foreach('db/allTides.csv', headers: true) do |row|
    if currentStation != row['STATION'] then
        currentStation = row['STATION']
        puts row['STATION']
        TidePrediction.create!(batch)
        batch = []
    end
    batch.push({station: row['STATION'], time: Time.parse("#{row['DATE']}T#{row['TIME']}"), depth: row['PRED_IN_FT'], highlow: row['HIGHLOW']})
    #
end
=end