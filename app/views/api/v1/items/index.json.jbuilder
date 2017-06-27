json.(@items) do |item|
  json.(item, :id, :description)
  json.num_orders(item.orders.count)
end
