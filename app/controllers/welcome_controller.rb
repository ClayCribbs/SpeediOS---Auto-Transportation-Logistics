class WelcomeController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show]


  def index
    @invoices = Invoice.order(:id)
    @drivers = Driver.order(:id)
    @orders = Order.order(:id)
  	@delivery_trucks = DeliveryTruck.order(:id)
  	@vehicles = Vehicle.order(:id)
    @destinations = Vehicle.select(:destination).order(:destination).distinct
    @deliveryTruckCount = @delivery_trucks.length


    #Get distance if missing
    if @vehicles.any?
  	@vehicles.each do |vehicle|
      if vehicle.distance == nil && vehicle.origin && vehicle.destination
    	   directions = GoogleDirections.new(vehicle.origin, vehicle.destination) 
         vehicle.update(distance: directions.distance_in_miles)
      end
  	end
  end
        #Check for carload truck / change truck
    if params[:truck_id]== nil && params[:carId]== nil
    else
      if @vehicles.any?
      @vehicles.each do |vehicle|
        if vehicle.id.to_s == params[:carId]
          vehicle.update(truck_id: params[:truck_id])
          vehicle.update(currentState: "Queued")
        end
      end
    end
    end

    #Check for destination filter
    if params[:destination]== nil
      @tableVehicles = Vehicle.where(currentState: "Available")
    else
      @tableVehicles = Vehicle.where("destination LIKE ?", params[:destination])
    end
    if @tableVehicles.any?
    @tableVehicleCount = @tableVehicles.length
  end
 #Check for origin filter
    if params[:origin]== nil
      @tableVehicles = Vehicle.where(currentState: "Available")
    else
      @tableVehicles = Vehicle.where("origin LIKE ?", params[:origin])
    end
    if @tableVehicles.any?
    @tableVehicleCount = @tableVehicles.length
  end




  end

  def consolepage
    @delivery_trucks = DeliveryTruck.all
    @vehicles = Vehicle.all
  end

end
