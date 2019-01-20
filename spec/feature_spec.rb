require_relative '../lib/order_board.rb'

describe :Features do
  context 'client places a buy order' do
    it 'should print out the buy order' do
      client = OrderBoard.new
      client.place_order(1, 1, 1, :BUY)
      expect { client.print_order_board }.to output(
        "BUY: 1kg for £1\n"
      ).to_stdout
    end
  end

  context 'client places a sell order' do
    it 'should print out the sell order' do
      client = OrderBoard.new
      client.place_order(1, 1, 1, :SELL)
      expect { client.print_order_board }.to output(
        "SELL: 1kg for £1\n"
      ).to_stdout
    end
  end

  context 'client places a buy and a sell order' do
    it 'should print out both orders' do
      client = OrderBoard.new
      client.place_order(1, 1, 1, :BUY)
      client.place_order(1, 1, 1, :SELL)
      expect { client.print_order_board }.to output(
        'BUY: 1kg for £1' \
        "\nSELL: 1kg for £1\n"
      ).to_stdout
    end
  end

  context 'client removes an order' do
    it 'should print out orders without the removed order' do
      client = OrderBoard.new
      client.place_order(1, 1, 1, :BUY)
      client.place_order(1, 1, 1, :SELL)
      client.remove_order(2)
      expect { client.print_order_board }.to output(
        "BUY: 1kg for £1\n"
      ).to_stdout
    end
  end

  context 'multiple orders of same price' do
    it 'should print out aggregated orders even if from different users' do
      client = OrderBoard.new
      client.place_order(1, 1, 1, :BUY)
      client.place_order(2, 4, 1, :SELL)
      client.place_order(1, 1, 1, :SELL)

      expect { client.print_order_board }.to output(
        'BUY: 1kg for £1' \
        "\nSELL: 5kg for £1\n"
      ).to_stdout
    end
  end

  context 'multiple orders' do
    it 'should print buy orders in ascending price and sell orders by descending price' do
      client = OrderBoard.new
      client.place_order(1, 1, 1, :BUY)
      client.place_order(1, 1, 5, :BUY)
      client.place_order(1, 1, 4, :BUY)
      client.place_order(1, 1, 4, :SELL)
      client.place_order(1, 1, 5, :SELL)
      client.place_order(1, 1, 1, :SELL)

      expect { client.print_order_board }.to output(
        'BUY: 1kg for £5' \
        "\nBUY: 1kg for £4" \
        "\nBUY: 1kg for £1" \
        "\nSELL: 1kg for £1" \
        "\nSELL: 1kg for £4" \
        "\nSELL: 1kg for £5\n"
      ).to_stdout
    end
  end
end
