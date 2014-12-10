class Van

	def initialize(options = {})
		@capacity = options.fetch(:capacity)
		@bikes = []
	end

	def accept(bike)
		raise 'Van full' if full?
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end

	def damaged_bikes
		@bikes.reject { |bike| !bike.broken? }
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end

end