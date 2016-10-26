class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  after_action :checkState, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show]
  require 'json'
  require 'open-uri'
 

  # GET /vehicles
  # GET /vehicles.json
  def index
   @vehicles = Vehicle.all
  end
  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
      @waypoints = Array.new
      if @vehicle.origin.nil? || @vehicle.destination.nil?
      else
      directions = GoogleDirections.new(@vehicle.origin, @vehicle.destination)
      @vehicle.update(distance: directions.distance_in_miles)
      end
      @waypoints.push @vehicle.destination
  end
  def checkState
      if @vehicle.truckId == "" || @vehicle.truckId == nil
        @vehicle.currentState = "Available"
      elsif @vehicle.currentState = "Available"
        @vehicle.currentState = "Queued"
      end
      @vehicle.save
  end
  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @vehicle.currentState = "Available";
    @vehicle.save
  end

  # GET /vehicles/1/edit
  def edit 
  end

  # POST /vehicles
  # POST /vehicles.json
  def create

    @vehicle = Vehicle.new(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update

    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:name, :make, :model, :details, :yearManufactured,:distance, :origin, :origin_latitude, :origin_longitude, :destination, :destination_latitude, :destination_longitude, :vinNumber, :minimumPossibleWeight, :maximumPossibleWeight, :actualWeight, :truckId, :image, :remote_image_url, :customername, :currentState, :company_id)
  end
end
