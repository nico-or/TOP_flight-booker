class FlightsController < ApplicationController
  def index
    @airports = Airport.first 10
    @flights = Flight.all
  end
end
