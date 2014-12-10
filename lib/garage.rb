class Garage

	def initialize
		@bikes = []
	end

	def bike_count
		@bikes.count
	end

	def van_unload(bike)
		@bikes << bike
	end

end