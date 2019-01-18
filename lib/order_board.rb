class OrderBoard
  def initialize(board_display = BoardDisplay.new, live_orders = LiveOrders.new)
    @board_display = board_display
    @live_orders = live_orders
  end

  def place_buy_order(user_id, quantity, price)
    @live_orders.create_buy_order(user_id, quantity, price)
    'Your order has been placed.'
  end

  def place_sell_order(user_id, quantity, price)
    @live_orders.create_sell_order(user_id, quantity, price)
    'Your order has been placed.'
  end
end
