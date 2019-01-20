require_relative 'live_orders'
require_relative 'order'
require_relative 'board_display'

class OrderBoard
  def initialize(board_display = BoardDisplay.new, live_orders = LiveOrders.new)
    @board_display = board_display
    @live_orders = live_orders
  end

  def place_order(user_id, quantity, price, type)
    @live_orders.add_order(create_order(user_id, quantity, price, type))
  end

  def remove_order(order_id)
    @live_orders.delete_order(order_id)
  end

  private

  def create_order(user_id, quantity, price, type)
    order_id = @live_orders.generate_order_id
    Order.new(user_id, quantity, price, type, order_id)
  end

end
