require_relative 'live_orders'
require_relative 'order'
require_relative 'board_display'
require_relative 'aggregator'
require_relative 'sorter'

class OrderBoard
  def initialize(
                  board_display = BoardDisplay.new(Aggregator.new),
                  live_orders = LiveOrders.new
                )
    @board_display = board_display
    @live_orders = live_orders
  end

  def place_order(user_id, quantity, price, type)
    raise 'Quantity and Price must be greater than 0' if quantity <= 0 || price <= 0
    raise 'Must be type :BUY or :SELL' if type != :BUY && type != :SELL
    @live_orders.add_order(create_order(user_id, quantity, price, type))
  end

  def remove_order(order_id)
    @live_orders.delete_order(order_id)
  end

  def print_order_board
    @board_display.print_board(@live_orders.get_by_type(:BUY), @live_orders.get_by_type(:SELL))
  end

  private

  def create_order(user_id, quantity, price, type)
    order_id = @live_orders.generate_order_id
    Order.new(user_id, quantity, price, type, order_id)
  end
end
