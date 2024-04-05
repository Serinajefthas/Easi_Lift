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

	# def new
	# 	@booking = Booking.new
	# 	@lift = Lift.find(params[:lift_id])
	# end	
	
	def create
		@lift = Lift.find(params[:lift_id])
		@booking = @lift.bookings.build(user: current_user)
	
		if @booking.save
		  redirect_to bookings_path, notice: 'Lift booked successfully.'
		else
		  render :index, alert: 'Booking failed.'
		end
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
