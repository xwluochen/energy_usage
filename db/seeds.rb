# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'net/http'
require 'json'

url = "https://data.cityofnewyork.us/resource/dnpn-ts5d.json"
resp = Net::HTTP.get_response(URI.parse(url))
buffer = resp.body
results = JSON.parse(buffer)

months = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
results.each do |month_result|
  unless month_result.empty?
  	measurement = Measurement.find_or_create_by(usage: month_result["measurement"])
    address =  Address.find_or_create_by(location: month_result["location_1_location"])
  	month_result.each do |key, value|
   		unless ["_1", "_2", "measurement", "location_1_location"].include?(key)
   			key_array = key.split("_")
   			if key_array.length > 3
          year = key_array[4].to_i
   				month = 7
      	else
          year = 2000 + (key_array[1].to_i)
        	month = months.index(key_array[0]) + 1
   			end
   	  	cost = Cost.find_or_create_by(year: year, month: month, month_cost: value, measurement_id: measurement.id, address_id: address.id)
   		end
  	end
  end
end