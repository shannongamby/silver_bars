class LiveOrders
  attr_reader :buy_orders, :sell_orders
  def initialize(generate_order = Order.new)
    @buy_orders = []
    @sell_orders = []
    @generate_order = generate_order
  end

  def add_buy_order(order)
    store(create_order(order, :BUY))
  end

  def add_sell_order(order)
     store(create_order(order, :SELL))
  end

  private

  def create_order(order, type)
    @generate_order.create(order[0], order[1], order[2], type)
  end

  def store(order)
    order.type == :BUY ? @buy_orders << order : @sell_orders << order
  end
end
