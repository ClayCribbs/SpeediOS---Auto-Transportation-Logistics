json.extract! invoice, :id, :client, :truckId, :userId, :total, :invoice_items, :dispatchdate, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)