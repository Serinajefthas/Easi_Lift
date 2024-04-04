class BookingsController < ApplicationController
	include ActionView::RecordIdentifier
	before_action :authenticate_user!

	def index
		@bookings = current_user.bookings
	end

	# GET /bookings/:id
	def show
		@booking = Booking.find(params[:id])
		@associated_lift = @booking.lift
	end

	# DELETE /bookings/:id
	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to lifts_path, notice: 'Booking successfully deleted'
	end

	# private
	# 	# Only allow a list of trusted parameters through.
	# 	def booking_params
	# 		params.require(:booking).permit(:id)
	# 	end
end
