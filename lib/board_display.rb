class BoardDisplay
  attr_reader :buy_board, :sell_board
  def initialize
    @buy_board = nil
    @sell_board = nil
  end

  def print_board(buy_orders, sell_orders)
    create_board(buy_orders, sell_orders)
  end

  def create_board(buy_orders, sell_orders)
    @buy_board = sort_orders(buy_orders)
    @sell_board = sort_orders(sell_orders)
  end

  def sort_orders(orders)
    if orders[0].type == :BUY
      orders.sort_by { |order| order.price }.reverse!
    else
      orders.sort_by { |order| order.price }
    end
  end
end
