class WelcomeController < ApplicationController
  def index

  	@delivery_trucks = DeliveryTruck.all
  	@vehicles = Vehicle.all
    @destinations = Vehicle.select(:destination).order(:destination).distinct
    newWeight = 0

    #Get distance if missing
  	@vehicles.each do |vehicle|
      if vehicle.distance == nil
    	   directions = GoogleDirections.new(vehicle.origin, vehicle.destination) 
         vehicle.update(distance: directions.distance_in_miles)
      end
  	end

    #Check for destination filter
    if params[:destination]== nil
      @tableVehicles = Vehicle.all
    else
      @tableVehicles = Vehicle.where("destination LIKE ?", params[:destination])
    end

    #Check for carload truck / change truck
    if params[:truckId]== nil || params[:carId]== nil
    else
      @vehicles.each do |vehicle|
        if vehicle.id.to_s == params[:carId]
          vehicle.update(truckId: params[:truckId])
        end
      end
    end

    if params[:q]
      page = params[:page] || 1
      @results = GoogleCustomSearchApi.search(params[:q], page: page)
    end




  end
end
