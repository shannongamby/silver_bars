class BoardDisplay
  def initialize(aggregator = Aggregator.new, sorter = Sorter.new)
    @aggregator = aggregator
    @sorter = sorter
  end

  def print_board(buy_orders, sell_orders)
    buy_board = create_board(buy_orders, :BUY)
    sell_board = create_board(sell_orders, :SELL)
    display(buy_board, :BUY)
    display(sell_board, :SELL)
  end

  def create_board(orders, type)
    @sorter.sort(@aggregator.aggregate(orders), type)
  end

  def display(board, type)
    board.each do |order|
      puts "#{type}: #{order[:quantity]}kg for £#{order[:price]}"
    end
  end
end
