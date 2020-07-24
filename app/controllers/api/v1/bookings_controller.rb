class Api::V1::BookingsController < ApiController
  include Concerns::UserAuthentication

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      UserMailer.send_booking(@booking).deliver_later
      return render json: {success: true, booking: @booking, message: "Your booking is successfully created"}, status: :created

    else
      return render json: {success: false, error: @booking.errors.full_messages.to_sentence}, status: :forbidden
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:name, :phone, :service, :address)
  end

end
