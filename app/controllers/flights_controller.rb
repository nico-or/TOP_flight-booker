class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order(:departure).includes(:departure_airport)
    @departure_countries = @flights.map(&:departure_airport).map(&:country).uniq.sort { |a, b| a.name <=> b.name }
    @arrival_countries = @flights.map(&:destination_airport).map(&:country).uniq.sort { |a, b| a.name <=> b.name }

    unless search_params.empty?
      @selection = []
      @selection += Airport.find_by_code(search_params[:departure_airport]).outgoing_flights.records
      @selection += Airport.find_by_code(search_params[:arrival_airport]).incoming_flights.records
      @selection << Flight.find(search_params[:time])
    end
  end

  private

  def search_params
    params.permit(:departure_airport, :arrival_airport, :time)
  end
end
