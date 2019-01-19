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

  context 'generating an order_id' do
    it 'should have an order_id of 1 if buy_orders is empty' do
      expect(subject.generate_order_id(:BUY)).to eq 1
    end
    it 'should have an order_id of 2 if buy_orders.size is 1' do
      allow(buy_order).to receive(:type) { :BUY }
      allow(buy_order).to receive(:order_id) { 1 }
      subject.add_order(buy_order)
      expect(subject.generate_order_id(:BUY)).to eq 2
    end
  end
end
