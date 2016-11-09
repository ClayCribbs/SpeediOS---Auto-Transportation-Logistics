class WelcomeController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:splash]


  def index
    @invoices = Invoice.order(:id)
    @drivers = Driver.order(:id)
    @orders = Order.order(:id)
  	@delivery_trucks = DeliveryTruck.order(:id)
  	@vehicles = Vehicle.order(:id)
    @deliveryTruckCount = @delivery_trucks.length
    @pendingcount = 0

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
    if params[:destination]== nil && params[:origin]== nil
      @tableVehicles = @vehicles.where(currentState: "Available")
    elsif params[:origin] == nil 
      @tableVehicles = @vehicles.where("destination LIKE ?", params[:destination], currentState: "Available")
    end

 #Check for origin filter
    if params[:origin]== nil && params[:destination]== nil
      @tableVehicles = @vehicles.where(currentState: "Available")
    elsif params[:destination] == nil
      @tableVehicles = @vehicles.where("origin LIKE ?", params[:origin])
    end
    if @tableVehicles.any?
    @tableVehicleCount = @tableVehicles.length
    end
  end

  def _truckmodal
    @truck = Truck.where(params[:truck_id])
    @vehicles = Vehicle.all
  end

  def consolepage
    @delivery_trucks = DeliveryTruck.all
    @vehicles = Vehicle.all
  end

end
