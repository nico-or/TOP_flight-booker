class FlightsController < ApplicationController
  def index
    @continents = Continent.all.order(:name).includes(:countries)
    @countries = Country.all.order(:name).includes(:airports)
  end
end
