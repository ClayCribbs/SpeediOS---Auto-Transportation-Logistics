class WelcomeController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show]


  def index

  	@delivery_trucks = DeliveryTruck.all
  	@vehicles = Vehicle.all
    @destinations = Vehicle.select(:destination).order(:destination).distinct
    @deliveryTruckCount = @delivery_trucks.length
    newWeight = 0

    #Get distance if missing
  	@vehicles.each do |vehicle|
      if vehicle.distance == nil && vehicle.origin.any? && vehicle.destination.any?
    	   directions = GoogleDirections.new(vehicle.origin, vehicle.destination) 
         vehicle.update(distance: directions.distance_in_miles)
      end
  	end

        #Check for carload truck / change truck
    if params[:truckId]== nil && params[:carId]== nil
    else
      @vehicles.each do |vehicle|
        if vehicle.id.to_s == params[:carId]
          vehicle.update(truckId: params[:truckId])
          vehicle.update(currentState: "Queued")
        end
      end
    end

    #Check for destination filter
    if params[:destination]== nil
      @tableVehicles = Vehicle.where(currentState: "Available")
    else
      @tableVehicles = Vehicle.where("destination LIKE ?", params[:destination])
    end
    @tableVehicleCount = @tableVehicles.length


    if params[:q]
      page = params[:page] || 1
      @results = GoogleCustomSearchApi.search(params[:q], page: page)
    end

  end

  def consolepage
    @delivery_trucks = DeliveryTruck.all
    @vehicles = Vehicle.all
  end

end
