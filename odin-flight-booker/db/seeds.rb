# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
airports = Airport.create([{ code: 'ORD' }, { code: 'JFK' }, { code: 'LAX' }, { code: 'ATL'}, { code: 'DFW' }])

airports = Airport.all

airports.each do |from|
	airports.each do |to|
		if from != to
			4.times do
				flight = Flight.create(origin: from, destination: to, datetime: Faker::Time.forward(7))
			end
		end
	end
end
