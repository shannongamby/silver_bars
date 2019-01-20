require 'order_board'

describe OrderBoard do
  let(:board_display) { double :board_display }

  context 'placing orders' do
    it 'should return the order' do
      live_orders = spy('live_orders')
      subject = OrderBoard.new(board_display, live_orders)
      subject.place_order(1, 1, 1, :BUY)
      expect(live_orders).to have_received(:add_order)
      expect(live_orders).to have_received(:generate_order_id)
    end
  end

  context 'removing orders' do
    it 'should return the order that has been removed' do
      live_orders = spy('live_orders')
      subject = OrderBoard.new(board_display, live_orders)
      subject.place_order(1, 1, 1, :BUY)
      subject.remove_order(1)
      expect(live_orders).to have_received(:delete_order).with(1)
    end

  end
end
