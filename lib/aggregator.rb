class Aggregator
  def aggregate(orders)
    aggregated_orders = {}
    orders.each do |order|
      if aggregated_orders.key?(order.price)
        aggregated_orders[order.price] += order.quantity
      else
        aggregated_orders[order.price] = order.quantity
      end
    end
    translate_to_list_of_hashes(aggregated_orders)
  end

  def translate_to_list_of_hashes(agg_orders)
    list = []
    agg_orders.each do |price, quantity|
      new_hash = {}
      new_hash[:price] = price
      new_hash[:quantity] = quantity
      list << new_hash
    end
    return list
  end
end
