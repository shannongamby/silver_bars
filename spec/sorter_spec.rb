require 'sorter'

describe Sorter do
  let(:order_one) do
    double(:order_two, price: 1, quantity: 5)
  end

  let(:order_two) do
    double(:order_two, price: 1, quantity: 2)
  end

  let(:order_three) do
    double(:order_three, price: 10, quantity: 2)
  end

  before :each do
    @orders = [{:price=>1, :quantity=>5}, {:price=>10, :quantity=>2}]
  end

  context 'sorting' do
    it 'should sort buy orders by descending price' do
      expect(subject.sort(@orders, :BUY)).to eq([{:price=>10, :quantity=>2}, {:price=>1, :quantity=>5}])
    end

    it 'should sort sell orders by ascending price' do
      expect(subject.sort(@orders, :SELL)).to eq([{:price=>1, :quantity=>5}, {:price=>10, :quantity=>2}])
    end
  end
end
