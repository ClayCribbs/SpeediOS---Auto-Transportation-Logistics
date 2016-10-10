class WelcomeController < ApplicationController
  
  def index

  	@delivery_trucks = DeliveryTruck.all
  	@vehicles = Vehicle.all
    @destinations = Vehicle.select(:destination).order(:destination).distinct
<<<<<<< HEAD
    @newWeight = 0
=======
    newWeight = 0
>>>>>>> clay

    @delivery_trucks.each do |truck|
      @vehicles.each do |vehicle|
        if vehicle.truckId == truck.id
          newWeight = truck.weightCapacity.to_i
          newWeight -= vehicle.actualWeight.to_i
          truck.update(weightCapacity: newWeight.to_i)
        end
      end
    end




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

    if params[:q]
      page = params[:page] || 1
      @results = GoogleCustomSearchApi.search(params[:q], page: page)
    end
<<<<<<< HEAD
  end

=======

  end


<<<<<<< HEAD
  
=======

  end
>>>>>>> clay
>>>>>>> 10265d3678c8c6194d4dbedc2199db8383f8b6ad
end
