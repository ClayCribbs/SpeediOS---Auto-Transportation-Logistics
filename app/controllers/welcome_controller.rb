class WelcomeController < ApplicationController
  def index
  	@delivery_trucks = DeliveryTruck.all
  	@vehicles = Vehicle.all
  	@vehicles.each do |vehicle|
    	directions = GoogleDirections.new(vehicle.origin, vehicle.destination) 
    	distance_in_miles = directions.distance_in_miles
    	vehicle.distance = distance_in_miles 
  	end
  end

  def about
  end
end
