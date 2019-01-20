require 'live_orders'

describe LiveOrders do
  let(:order) { double :order }
  let(:buy_order) { double :buy_order }
  let(:sell_order) { double :sell_order }

  context 'storing orders' do
    it 'should store orders' do
      subject.add_order(order)
      expect(subject.orders.first).to eq order
    end
    it 'should return the added order object' do
      expect(subject.add_order(order)).to eq order
    end
  end

  context 'removing orders' do
    it 'should remove order from orders' do
      allow(order).to receive(:order_id) { 1 }
      subject.add_order(order)
      subject.delete_order(1)
      expect(subject.orders).to eq []
    end
    it 'should return the removed order object' do
      allow(order).to receive(:order_id) { 1 }
      subject.add_order(order)
      expect(subject.delete_order(1)).to eq order
    end
  end

  context 'generating an order_id' do
    it 'should have an order_id of 1 if orders is empty' do
      expect(subject.generate_order_id).to eq 1
    end

    it 'should have an order_id of 2 if orders.size is 1' do
      allow(order).to receive(:order_id) { 1 }
      subject.add_order(order)
      expect(subject.generate_order_id).to eq 2
    end
  end

  context 'getting orders' do
    it 'should get orders by id' do
      allow(order).to receive(:order_id) { 1 }
      subject.add_order(order)
      expect(subject.get_by_id(1)).to eq order
    end
    it 'should get orders by type' do
      allow(buy_order).to receive(:type) { :BUY }
      allow(sell_order).to receive(:type) { :SELL }
      subject.add_order(buy_order)
      subject.add_order(sell_order)
      expect(subject.get_by_type(:BUY)).to eq [buy_order]
    end
  end
end
