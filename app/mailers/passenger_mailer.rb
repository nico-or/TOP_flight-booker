class PassengerMailer < ApplicationMailer
  def confirmation_email
    @user = params[:user]
    @booking = params[:booking]
    mail(to: @user.email, subject: 'Flight booking confirmation')
  end
end
