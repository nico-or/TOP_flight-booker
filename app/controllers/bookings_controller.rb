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
    @flight = Flight.find(booking_params[:flight_id])
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(user: passenger, booking: @booking).confirmation_email.deliver_now
      end
      flash[:notice] = "Booking successfully created"
      redirect_to @booking
    else
      flash[:alert] = "Booking could not be saved"
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
      passengers_attributes: [:name, :email])
  end
end
