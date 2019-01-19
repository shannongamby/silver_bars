require 'order_board'

describe OrderBoard do
  let(:board_display) { double :board_display }
  let(:live_orders) { double :live_orders }
  subject { described_class.new(board_display, live_orders) }

  context 'placing orders' do
    it 'should confirm that a buy order has been placed' do
      allow(live_orders).to receive(:add_order)
      expect(subject.place_buy_order(1, 10, 100)).to eq 'Your order has been placed.'
    end

    it 'should confirm that a sell order has been placed' do
      allow(live_orders).to receive(:add_order)
      expect(subject.place_sell_order(1, 10, 100)).to eq 'Your order has been placed.'
    end
  end
end
