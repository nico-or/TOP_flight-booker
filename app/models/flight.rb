class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'

  belongs_to :destination_airport, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  def strf_departure_ymd
    departure.strftime('%Y%m%d')
  end

  def strf_departure_dmy
    departure.strftime('%d/%m/%Y')
  end

  def radio_label
    departure_airport_name = departure_airport.name
    destination_airport_name = destination_airport.name
    departure_country_name = Country.find(departure_airport.country_id).name
    destination_country_name = Country.find(destination_airport.country_id).name

    departure_string = "#{departure_airport_name} (#{departure_country_name})"
    destination_string = "#{destination_airport_name} (#{destination_country_name})"

    "#{departure_string} → #{destination_string} @#{departure}"
  end
end
