class CartController < ApplicationController
  
	def add_to_cart
	  line_item = LineItem.create(vehicle_id: params[:vehicle_id],bid_total: params[:bid_total], dispatch_date: params[:dispatch_date], order_id: params[:order_id], truck_id: params[:truck_id])
	  line_item.save
    vehicle = Vehicle.find(params[:vehicle_id])
    vehicle.update(currentState: "Queued")
    vehicle.save
	  redirect_to root_path
	end

  def view_order
  	@line_items = LineItem.all
  end

  def checkout
    @line_items = LineItem.all
    @order = Order.create(user_id: current_user.id, subtotal: 0)

    @line_items.each do |line_item|
      @order.order_items[line_item.vehicle_id] = line_item.bid_total
      @order.subtotal += line_item.bid_total
      @order.truck_id = line_item.truck_id.to_i
      vehicle = Vehicle.find(line_item.vehicle_id)
      truck = DeliveryTruck.find(line_item.truck_id)
      vehicle.update(currentState: "Dispatched")
      truck.update(currentState: "Dispatched")
      vehicle.save
      truck.save
    end
    @order.currentState = "Unpaid"
    @order.sales_tax = @order.subtotal * 0.07
    @order.grand_total = @order.subtotal + @order.sales_tax
    @order.save


    LineItem.destroy_all
  end
end
