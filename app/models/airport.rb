class Airport < ApplicationRecord
  has_many :outgoing_flights, {
    class_name: 'Flight',
    foreign_key: :departure_airport_id,
  }

  has_many :incoming_flights, {
    class_name: 'Flight',
    foreign_key: :destination_airport_id,
  }

  belongs_to :country
  has_one :continent, through: :country
end
