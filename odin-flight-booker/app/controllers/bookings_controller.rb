class BookingsController < ApplicationController

	def new
		@flight        = Flight.find(params[:flight_id])
		@booking       = @flight.bookings.build
		build_passengers(params[:num_passengers], @booking)
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			redirect_to @booking
		else
			render 'new'
		end
	end

	def show
		@booking = Booking.find(params[:id])

	end


  private

  def build_passengers(passengers, booking)
  	if passengers.blank?
  		booking.passengers.build
  	else
  		passengers.to_i.times { @booking.passengers.build }
  	end
  end


  def booking_params
  	params.require(:booking).permit(:flight_id, 
  		                    :passengers_attributes => [:name, :email])
  end

end