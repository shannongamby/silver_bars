class LiveOrders
  attr_reader :buy_orders, :sell_orders
  def initialize
    @buy_orders = []
    @sell_orders = []
  end

  def add_buy_order(order)
    @buy_orders << order
  end

  def add_sell_order(order)
     @sell_orders << order
  end

end
