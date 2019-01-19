require 'live_orders'

describe LiveOrders do
  let(:buy_order) { double :buy_order }
  let(:sell_order) { double :sell_order }

  context 'storing orders' do
    it 'should store buy orders correctly' do
      allow(buy_order).to receive(:type) { :BUY }
      subject.add_order(buy_order)
      expect(subject.buy_orders.first).to eq buy_order
    end

    it 'should store sell orders correctly' do
      allow(sell_order).to receive(:type) { :SELL }
      subject.add_order(sell_order)
      expect(subject.sell_orders.first).to eq sell_order
    end
  end
end
