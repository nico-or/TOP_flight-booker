# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'faker'

def load_csv(path)
  opts = { headers: true, header_converters: :symbol }
  CSV.read(path, opts)
end

## Continents
# Headers:[:code, :name]
data = load_csv('db/csv-data/continent-codes.csv')

data.each do |row|
  Continent.find_or_create_by(
    code: row[:code],
    name: row[:name]
  )
end

## Countries
# Headers: [ .... ]
data = load_csv('db/csv-data/country-codes.csv')

data.each do |row|
  continent = Continent.find_by_code(row[:continent])
  next unless continent

  continent.countries.find_or_create_by(
    code: row[:iso31661alpha2],
    name: row[:cldr_display_name]
  )
end

## Airports
# Headers: [ :ident, :type, :name, :elevation_ft, :continent, :iso_country,
#   :iso_region, :municipality, :gps_code, :iata_code, :local_code, :coordinates]
data = load_csv('db/csv-data/airport-codes.csv')
data.delete_if { |e| e[:type] != 'large_airport' }
data.delete_if { |e| e[:iata_code].nil? }

data.each do |row|
  country = Country.find_by_code(row[:iso_country])
  next unless country

  country.airports.find_or_create_by(
    code: row[:iata_code],
    name: row[:name]
  )
end

## Flights
NUM_FLIGHTS = 20
AIRPORTS_IDS = Airport.ids

NUM_FLIGHTS.times do
  departure_id = AIRPORTS_IDS.sample
  destination_id = departure_id
  loop do
    destination_id = AIRPORTS_IDS.sample
    break if destination_id != departure_id
  end
  flight_duration = (1.hour + rand(3.hours)).in_seconds
  departure_datetime = Faker::Time.forward(days: 365)

   Flight.create(
    departure_airport_id: departure_id,
    destination_airport_id: destination_id,
    departure: departure_datetime,
    duration: flight_duration
  )
end
