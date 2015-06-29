class Flight < ActiveRecord::Base
	belongs_to :origin, class_name: "Airport"
	belongs_to :destination, class_name: "Airport"
	has_many :bookings
	
	def self.search(params)
		if params[:search]
			Flight.where(origin: params[:origin], destination: params[:destination])
		else 
			Flight.none
		end
	end
	
end
