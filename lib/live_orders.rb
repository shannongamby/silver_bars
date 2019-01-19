class LiveOrders
  attr_reader :buy_orders, :sell_orders
  def initialize
    @buy_orders = []
    @sell_orders = []
  end

  def add_order(order)
    order.type == :BUY ? @buy_orders << order : @sell_orders << order
  end

  def generate_order_id(type)
    orders = type == :BUY ? @buy_orders : @sell_orders
    order_id = orders[-1] == nil ? 1 : order_id = orders[-1].order_id + 1
  end

end
