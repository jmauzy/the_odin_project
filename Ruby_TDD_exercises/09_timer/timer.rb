class Timer
attr_accessor :seconds
	def initialize(seconds = 0)
		@seconds = seconds
	end
	def time_string()
		sec = seconds
		hour_string = (sec / 3600).to_s
		min_string =((sec % 3600) / 60).to_s
		sec_string = (sec % 60).to_s
		return "#{'%02d'%hour_string}:#{'%02d'%min_string}:#{'%02d'%sec_string}"
		
	end
end