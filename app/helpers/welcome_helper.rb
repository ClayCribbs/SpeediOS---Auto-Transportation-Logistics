module WelcomeHelper
	def refreshVehicles
		@vehicles = Vehicle.all
	end
end
