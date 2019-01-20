require './lib/order_board.rb'

new = OrderBoard.new

new.place_order(1, 1, 1, :BUY)
new.place_order(1, 1, 1, :BUY)
new.place_order(1, 1, 10, :BUY)
new.place_order(1, 1, 100, :BUY)

new.place_order(1, 1, 1, :SELL)
new.place_order(1, 1, 10, :SELL)
new.place_order(1, 1, 5, :SELL)
new.place_order(1, 1, 5, :SELL)

puts "\n8 orders have been placed: 4 buy orders and 4 sell orders"
puts "2 buy orders have been aggregated to a quantity of 2kg"
puts "2 sell orders have been aggregated to a quantity of 2kg"
puts "\nHere is the order board:\n"
new.print_order_board

puts "\nAnd when we remove a buy order:\n"
new.remove_order(4)
new.print_order_board

puts "\nAnd when we remove a sell order that has been aggregated:\n"
new.remove_order(8)
new.print_order_board
