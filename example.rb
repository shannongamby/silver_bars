require './lib/order_board.rb'

client = OrderBoard.new

client.place_order(1, 1, 1, :BUY)
client.place_order(1, 1, 1, :BUY)
client.place_order(1, 1, 10, :BUY)
client.place_order(1, 1, 100, :BUY)

client.place_order(1, 1, 1, :SELL)
client.place_order(1, 1, 10, :SELL)
client.place_order(1, 1, 5, :SELL)
client.place_order(1, 1, 5, :SELL)

puts "\n8 orders have been placed: 4 buy orders and 4 sell orders"
puts "2 buy orders have been aggregated to a quantity of 2kg"
puts "2 sell orders have been aggregated to a quantity of 2kg"

puts "\nHere is the order board:\n"
client.print_order_board

puts "\nAnd when we remove a buy order:\n"
client.remove_order(4)
client.print_order_board

puts "\nAnd when we remove a sell order that has been aggregated:\n"
client.remove_order(8)
client.print_order_board
