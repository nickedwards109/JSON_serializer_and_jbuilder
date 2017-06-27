json.(@item, :id, :description)
json.num_orders(@item.orders.count)
json.orders @item.orders do |order|
  json.(order, :id)
end
