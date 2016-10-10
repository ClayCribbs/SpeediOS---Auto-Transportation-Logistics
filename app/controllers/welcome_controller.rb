class WelcomeController < ApplicationController
  def index

  	@delivery_trucks = DeliveryTruck.all
  	@vehicles = Vehicle.all
    @destinations = Vehicle.select(:destination).order(:destination).distinct

  	@vehicles.each do |vehicle|
      if vehicle.distance == nil
    	   directions = GoogleDirections.new(vehicle.origin, vehicle.destination) 
         vehicle.update(distance: directions.distance_in_miles)
      end
  	end

    if params[:destination]== nil
      @tableVehicles = Vehicle.all
    else
      @tableVehicles = Vehicle.where("destination LIKE ?", params[:destination])
    end

    if params[:truckId]== nil || params[:carId]== nil
    else
      @vehicles.each do |vehicle|
        if vehicle.id.to_s == params[:carId]
          vehicle.update(truckId: params[:truckId])
        end
      end
    end

  end
end
