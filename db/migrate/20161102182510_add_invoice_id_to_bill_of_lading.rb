class AddInvoiceIdToBillOfLading < ActiveRecord::Migration[5.0]
  def change
    add_column :bill_of_ladings, :invoice_id, :integer
  end
end
