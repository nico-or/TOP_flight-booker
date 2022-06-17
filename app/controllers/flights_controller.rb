class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order(:departure).includes(:departure_airport)
    @departure_countries = @flights.map(&:departure_airport).map(&:country).uniq.sort { |a, b| a.name <=> b.name }
    @arrival_countries = @flights.map(&:destination_airport).map(&:country).uniq.sort { |a, b| a.name <=> b.name }
  end
end
