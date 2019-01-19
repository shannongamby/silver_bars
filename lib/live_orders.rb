class LiveOrders
  attr_reader :buy_orders, :sell_orders
  def initialize
    @buy_orders = []
    @sell_orders = []
  end

  def add_order(order)
    order.type == :BUY ? @buy_orders << order : @sell_orders << order
  end
end
