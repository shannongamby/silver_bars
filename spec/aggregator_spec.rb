require 'aggregator'

describe Aggregator do

  let(:order_one) do
    double(:order_one, price: 1, quantity: 5)
  end

  let(:order_two) do
    double(:order_two, price: 1, quantity: 2)
  end

  let(:order_three) do
    double(:order_three, price: 10, quantity: 2)
  end

  context 'aggregating' do
    it 'should aggregate orders of same price' do
      expect(subject.aggregate([order_one, order_two])).to eq([{:price=>1, :quantity=>7}])
    end

    it 'should not aggregate orders of different prices' do
      expect(subject.aggregate([order_one, order_three])).to eq([{:price=>1, :quantity=>5}, {:price=>10, :quantity=>2}])
    end
  end
end
