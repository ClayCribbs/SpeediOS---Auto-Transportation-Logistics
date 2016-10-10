class AddCurrentWeightToDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_trucks, :currentWeight, :float
  end
end
