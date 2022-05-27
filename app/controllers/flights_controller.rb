class FlightsController < ApplicationController
  def index
    @continents = Continent.all.includes(:countries)
    @countries = Country.all.includes(:airports)
  end
end
