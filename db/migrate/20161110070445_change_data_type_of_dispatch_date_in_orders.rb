class ChangeDataTypeOfDispatchDateInOrders < ActiveRecord::Migration[5.0]
  def change
  	change_column :orders, :dispatch_date, :datetime
  end
end

