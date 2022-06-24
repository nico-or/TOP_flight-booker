class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      flash.now[:alert] = 'Booking could not be saved'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
      passengers_attributes: [:name, :email])
  end
end
