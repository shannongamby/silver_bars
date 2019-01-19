require_relative 'live_orders'
require_relative 'order'
require_relative 'board_display'

class OrderBoard
  def initialize(board_display = BoardDisplay.new, live_orders = LiveOrders.new)
    @board_display = board_display
    @live_orders = live_orders
  end

  def place_buy_order(user_id, quantity, price)
    order = create_order(user_id, quantity, price, :BUY)
    @live_orders.add_buy_order(order)
    'Your order has been placed.'
  end

  def place_sell_order(user_id, quantity, price)
    order = create_order(user_id, quantity, price, :SELL)
    @live_orders.add_sell_order(order)
    'Your order has been placed.'
  end

  private

  def create_order(user_id, quantity, price, type)
    Order.new(user_id, quantity, price, type)
  end
end
