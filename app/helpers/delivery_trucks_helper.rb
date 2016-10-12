module DeliveryTrucksHelper

	def getWaypoints
		@myVehicles.each do |vehicle|
			if vehicle.origin == @delivery_truck.origin or @waypoints.include? vehicle.origin
			else
		  	@waypoints.push(vehicle.origin)
			end
			if vehicle.destination == @delivery_truck.origin or @waypoints.include? vehicle.destination
			else
		  	@waypoints.push(vehicle.destination)
			end
		end 
	end

end
