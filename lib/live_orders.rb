class LiveOrders
  attr_reader :orders
  def initialize
    @orders = []
  end

  def add_order(order)
    @orders << order
    return order
  end

  def delete_order(id)
    order = get_by_id(id)
    @orders.delete_if { |order| order.order_id == id }
    return order
  end

  def get_by_id(id)
    @orders.each { |order|
      return order if order.order_id == id
    }
  end

  def get_by_type(type)
    @orders.select { |order| order.type == type }
  end

  def generate_order_id
    @orders.sort_by! { |order| order.order_id }
    if @orders.empty?
      1
    else
      @orders[-1].order_id + 1
    end
  end
end
