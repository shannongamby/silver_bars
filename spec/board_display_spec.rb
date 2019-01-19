require 'board_display'
require 'order'

describe BoardDisplay do
  context 'ordering by price' do
    before :each do
      @buy_one = Order.new(1, 10, 100, :BUY, 1)
      @buy_two = Order.new(1, 10, 1, :BUY, 2)
      @buy_three = Order.new(1, 10, 10, :BUY, 3)
      @sell_one = Order.new(1, 10, 100, :SELL, 1)
      @sell_two = Order.new(1, 10, 1, :SELL, 2)
      @sell_three = Order.new(1, 10, 10, :SELL, 3)
    end

    it 'should store buy_orders ordered by price (descending)' do
      subject.print_board([@buy_one, @buy_two, @buy_three], [@sell_one, @sell_two, @sell_three])
      expect(subject.buy_board).to eq [@buy_one, @buy_three, @buy_two]
    end

    it 'should store sell_orders ordered by price (ascending)' do
      subject.print_board([@buy_one, @buy_two, @buy_three], [@sell_one, @sell_two, @sell_three])
      expect(subject.sell_board).to eq [@sell_two, @sell_three, @sell_one]
    end
  end

end
