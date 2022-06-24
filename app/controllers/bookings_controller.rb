class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
      passengers_attributes: [:name, :email])
  end
end
