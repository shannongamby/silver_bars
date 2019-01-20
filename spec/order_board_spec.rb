require 'order_board'

describe OrderBoard do
  let(:board_display) { double :board_display }
  let(:live_orders) { double :live_orders }

  context 'placing orders' do
    it 'should pass the order to live_orders' do
      live_orders = spy('live_orders')
      subject = OrderBoard.new(board_display, live_orders)
      subject.place_order(1, 1, 1, :BUY)
      expect(live_orders).to have_received(:add_order)
      expect(live_orders).to have_received(:generate_order_id)
    end

    it 'should raise error if not type :BUY or type :SELL' do
      expect { subject.place_order(1, 1, 1, :HELLO) }.to raise_error 'Must be type :BUY or :SELL'
    end

    it 'should raise error if quantity not positive' do
      expect { subject.place_order(1, -1, 1, :BUY) }.to raise_error 'Quantity and Price must be greater than 0'
    end

    it 'should raise error if price is not positive' do
      expect { subject.place_order(1, 1, -1, :BUY) }.to raise_error 'Quantity and Price must be greater than 0'
    end
  end

  context 'removing orders' do
    it 'should pass the order to live_orders' do
      live_orders = spy('live_orders')
      subject = OrderBoard.new(board_display, live_orders)
      subject.place_order(1, 1, 1, :BUY)
      subject.remove_order(1)
      expect(live_orders).to have_received(:delete_order).with(1)
    end
  end

  context 'printing orders' do
    it 'should pass the order to board_display' do
      board_display = spy('board_display')
      live_orders = spy('live_orders')
      subject = OrderBoard.new(board_display, live_orders)
      subject.print_order_board
      expect(board_display).to have_received(:print_board)
      expect(live_orders).to have_received(:get_by_type).with(:BUY)
      expect(live_orders).to have_received(:get_by_type).with(:SELL)
    end
  end
end
