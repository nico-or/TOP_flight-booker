class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'

  belongs_to :destination_airport, class_name: 'Airport'

  def strf_departure_ymd
    departure.strftime('%Y%m%d')
  end

  def strf_departure_dmy
    departure.strftime('%d/%m/%Y')
  end
end
