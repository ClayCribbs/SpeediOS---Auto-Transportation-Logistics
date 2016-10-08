class WelcomeController < ApplicationController
  def index
  	@delivery_trucks = DeliveryTruck.all
  	@vehicles = Vehicle.all
  end

  def about
  end
end
