require 'live_orders'

describe LiveOrders do
  let(:generate_order) { double :generate_order }
  subject { described_class.new(generate_order) }
  let(:buy_order) { double :buy_order }
  let(:sell_order) { double :sell_order }

  context 'storing orders' do
    it 'should store buy orders correctly' do
      allow(generate_order).to receive(:create) { buy_order }
      allow(buy_order).to receive(:type) { :BUY }
      subject.add_buy_order([1, 10, 100])
      expect(subject.buy_orders.first).to eq buy_order
    end
    it 'should store sell orders correctly' do
      allow(generate_order).to receive(:create) { sell_order }
      allow(sell_order).to receive(:type) { :SELL }
      subject.add_sell_order([1, 10, 100])
      expect(subject.sell_orders.first).to eq sell_order
    end
  end
end
